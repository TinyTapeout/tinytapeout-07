import glob
import json
import random

# Set the path pattern
pattern = 'tt_um*/commit_id.json'

# Find all files matching the pattern
files = glob.glob(pattern)

# Calculate the number of files to modify
num_to_skip = int(0.98 * len(files))

# Randomly select files to add "skip": true
files_to_skip = random.sample(files, num_to_skip)

for file_path in files:
    # Read the current JSON data from the file
    with open(file_path, 'r') as file:
        data = json.load(file)
    
    # Modify the file if it's selected to have the "skip": true
    if file_path in files_to_skip:
        data['skip'] = True
    
    # Write the modified data back to the file with an indent of 2 spaces
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=2)

print(f'Added "skip": true to {num_to_skip} files.')
