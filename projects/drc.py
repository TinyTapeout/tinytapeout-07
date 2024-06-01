import glob
import subprocess
import sys

def run_drc_on_files():
    # Search for files with the specified pattern
    file_pattern = "tt_um_*/tt_um_*.gds"
    files = glob.glob(file_pattern)

    if not files:
        print("No files found matching the pattern.")
        return

    # Path to the DRC script
    drc_script_path = "/home/uri/p/tinytapeout-06/tt/precheck/tech-files/zeroarea.drc"
    print("START")

    # Iterate over each file and run the command
    for filename in files:
        sys.stderr.write(f"Checking {filename}...\n")

        # Prepare the command to run
        command = [
            "klayout", "-b", 
            "-r", drc_script_path,
            "-rd", f"input={filename}"
        ]
        
        # Execute the command
        try:
            result = subprocess.run(command, check=True)
            print(f"Processed {filename} successfully with exit code {result.returncode}")
        except subprocess.CalledProcessError as e:
            print(f"Error processing {filename}: {e}")
            sys.exit(1)

    print("All files processed successfully.")

# Run the function
run_drc_on_files()