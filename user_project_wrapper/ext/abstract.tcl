# magic commands to abstract cells.
# well connectivity is detemined by CIFIN_STYLE and EXTRACT_STYLE.
# output directory set by environment variable EXT_DIR

puts "Abstracting"
drc off
crashbackups stop
gds drccheck off
undo disable
if {[string first sky130 sky130A] >= 0} {
	cif istyle sky130()

} elseif {[string first gf180mcu sky130A] >= 0} {
	cif istyle import()

} else {
	puts "ERROR: Unknown PDK - sky130A"
	exit 1
}

set last_time [orig_clock seconds]
puts "Abstracting /home/uri/p/tinytapeout-06/efabless/gds/openframe_project_wrapper.gds"
gds read /home/uri/p/tinytapeout-06/efabless/gds/openframe_project_wrapper.gds
cd /home/uri/p/tinytapeout-06/user_project_wrapper/ext
set current_time [orig_clock seconds]
puts "\nTIME: read GDS: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format  %H:%M:%S] \n"
set last_time $current_time

# Create subcut gds
foreach cell {  } {
	# Adds an isosub/subcut layer to the cell.
	# 1. For each cell, create a new cell with an isosub/subcut layer = boundary - ( dnwell | isosub ).
	load $cell
	select top cell
	set cellboundary [view bbox] ;# Save the boundary.
	expand
	puts stdout "Creating subcut for $cell ..."
	set subcut_cell_name ${cell}_subcut
	flatten -nolabels $subcut_cell_name ;# Flatten into a cell with a new name.
	load $subcut_cell_name
	property FIXED_BBOX $cellboundary ;# Reset the boundary after flattening.
	cif ostyle subcutout
	gds write $subcut_cell_name ;# Write just the subcut layer.
}
set current_time [orig_clock seconds]
puts "\nTIME: create subcut: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format %H:%M:%S] \n"
set last_time $current_time

# Create abstract cells
foreach cell {  } { ;# Set abstract cells and delete all their subcell instances.
	load $cell
	property LEFview true
	puts "Abstracting $cell"
	set instance_list [cellname list childinst $cell]
	set instance_count [llength $instance_list]
	select top cell
	select visible
	set port_list [lindex [what -list] 1]
	puts "instance count:$instance_count port count:[llength $port_list]"
	if { $instance_count > 0 || [llength $port_list] > 10 } {
		# When an abstract cell has child, all the children are extracted.
		# To avoid this, delete the child instances.
		# If there are many instances this can take hours.
		# Split the layout up into a grid and delete by grid.
		select top cell
		set cell_bbox [box values]
		puts "Full size $cell_bbox"
		set cell_left [lindex $cell_bbox 0]
		set cell_bottom [lindex $cell_bbox 1]
		set cell_right [lindex $cell_bbox 2]
		set cell_top [lindex $cell_bbox 3]
		set cell_height [box height]
		set cell_width [box width]
		see no *
		set window_size 100
		set current_time [orig_clock seconds]
		set start_time $current_time
		# Coordinates returned from box are in internal units.
		# Without qualifiers, arguments to box are in lambda units. Force internal units with i suffix.
		# Search for a region where the subcells can be deleted in under 12 seconds. Region is increased 4x each loop.
		while { [expr $current_time - $start_time] < 3 && $window_size < $cell_height && $window_size < $cell_width } {
			set start_time $current_time
			incr window_size $window_size
			box size ${window_size}i ${window_size}i
			select visible
			select less area * ;# unselect text
			delete
			set current_time [orig_clock seconds]
		}
		set step_estimate [expr $cell_height / $window_size * $cell_width / $window_size]
		puts "Setting deletion window size to $window_size. Estimate $step_estimate steps."
		set step_count 0
		for {set box_left $cell_left} {$box_left < $cell_right} {incr box_left $window_size} {
			for {set box_bottom $cell_bottom} {$box_bottom < $cell_top} {incr box_bottom $window_size} {
				incr step_count
				box position ${box_left}i ${box_bottom}i
				select visible
				select less area * ;# unselect text
				puts "Step $step_count/$step_estimate: deleting [llength [lindex [what -list] 2]] objects at [box values]"
				delete
			}
		}
		# Delete instances that may have been missed.
		select top cell
		select visible
		select less area *
		puts "Deleting [llength [lindex [what -list] 2]] final objects"
		delete

		# Delete non-port layers. Shorted ports can cause problems in parent hierarchy.
		# Deleting non-port layers should eliminate the shorts.
		see *
		select visible
		set select_list [what -list]
		see no *
		foreach layer [lindex $select_list 0] {
			select area $layer ;# select ports
			if { [llength [lindex [what -list] 1]] == 0 } {	
				see $layer
				select visible $layer
				puts "Deleting $layer"
				delete
			}
		}
		lef nocheck vssd1 vssd2 vccd1 vccd2 vssa1 vssa2 vdda1 vdda2
		lef write $cell -hide -pinonly
	}
}
set current_time [orig_clock seconds]
puts "\nTIME: create abstract: [orig_clock format [expr {$current_time - $last_time}] -gmt true -format %H:%M:%S] \n"
set last_time $current_time
