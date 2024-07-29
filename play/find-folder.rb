# Specify the root directory where you want to search for folders
root_directory = '/path/to/your/root/directory'

# Recursively search for folders with spaces in their names
def find_folders_with_spaces(directory)
  Dir.glob(File.join(directory, '**/*')).select do |item|
    next if item == '.' || item == '..'
    File.directory?(item) && File.basename(item).include?(' ')
  end
end

# Example usage:
folders_with_spaces = find_folders_with_spaces(root_directory)
folders_with_spaces.each do |folder|
  puts "Folder with spaces found: #{folder}"
  # You can perform additional actions here if needed
end
