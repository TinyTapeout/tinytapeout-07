# magic commands to extract netlist.
# well connectivity is detemined by CIFIN_STYLE and EXTRACT_STYLE.
# output directory set by environment variable EXT_DIR

puts "Extracting with top ports connected by name (analog)"
drc off
crashbackups stop
gds drccheck off
undo disable
if {[string first sky130 sky130A] >= 0} {
	cif istyle sky130(nowell)

} elseif {[string first gf180mcu sky130A] >= 0} {
	cif istyle import(nowell)

} else {
	puts "ERROR: Unknown PDK - sky130A"
	exit 1
}

set last_time [orig_clock seconds]
foreach cell {  } { ;# Load abstract cells
	if { [file exists /home/uri/p/tinytapeout-06/user_project_wrapper/nowell.ext/$cell.lef] } {
		puts "Using abstracted $cell"
		lef read /home/uri/p/tinytapeout-06/user_project_wrapper/nowell.ext/$cell.lef
	}
}

foreach cell {  } {
	gds flatglob $cell
}
# list cells to be flattened
puts "Flattening [string map {" " "\n"} [gds flatglob]]"
gds flatten yes ;# Flattens cells with few layers
gds noduplicates yes ;# keep abstract views
puts "\nExtracting /home/uri/p/tinytapeout-06/efabless/gds/openframe_project_wrapper.gds"
gds read /home/uri/p/tinytapeout-06/efabless/gds/openframe_project_wrapper.gds
cd /home/uri/p/tinytapeout-06/user_project_wrapper/nowell.ext
set current_time [orig_clock seconds]
puts "\nTIME: read GDS: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format %H:%M:%S] \n"
set last_time $current_time

set flatglob_error 0
foreach cell {  } { ;# Check for unflattened flatglob cells.
	if { [llength [cellname list children $cell]] > 0 } {
		set flatglob_error 1
		puts "Could not flatten $cell because it contains these subcells:"
		foreach subcell [cellname list children $cell] {
			puts "  $subcell"
		}
	}	
}
if { $flatglob_error } { ;# Quit if there are unflattened flatglob cells.
	exit 1
}

gds flatten no ;# subcut cells will have few shapes, so don't flatten them when reading their gds later.

foreach cell {  } {
	# Adds an isosub/subcut layer to the cell.
	# 2. Add this new cell to the original cell.
	# 3. Flatten the new cell instance in the original cell.
	set subcut_cell_name ${cell}_subcut
	gds read $subcut_cell_name ;# Read the subcut only cell.
	load $cell
	select top cell
	getcell $subcut_cell_name child 0 0 parent 0 0 ;# Place the subcut cell at the origin.
	puts "Flattening [instance list self] in $cell"
	flatten -doinplace [instance list self] ;# flatten subcut cell to place subcut layer.
}
set current_time [orig_clock seconds]
puts "\nTIME: add subcut: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format %H:%M:%S] \n"
set last_time $current_time

foreach cell {  } { ;# Set abstract cells
	load $cell
	property LEFview true
	puts "Abstracting $cell"
}
set current_time [orig_clock seconds]
puts "\nTIME: set abstract: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format %H:%M:%S] \n"
set last_time $current_time

load user_project_wrapper
select top cell
expand
extract no all ;# clear all flags
extract do aliases
extract do local
extract unique notopports
extract style ngspice(nowell)
extract
set current_time [orig_clock seconds]
puts "\nTIME: extract: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format %H:%M:%S] \n"
set last_time $current_time

ext2spice lvs
ext2spice merge conservative ;# reduce parallel devices
ext2spice short resistor ;# keep both ports but connect them with a 0 ohm resistor
ext2spice -o user_project_wrapper.gds.spice user_project_wrapper.ext
set current_time [orig_clock seconds]
puts "\nTIME: netlist: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format %H:%M:%S] \n"
set last_time $current_time

feedback save user_project_wrapper-ext2gds.spice.feedback.txt
