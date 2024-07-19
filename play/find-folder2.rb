# Specify the root directory where you want to search for folders
root_directory = '/path/to/your/root/directory'

# Recursively find all folders with spaces
folders_with_spaces = Dir.glob(File.join(root_directory, '**/*'))
                      .select { |item| File.directory?(item) && File.basename(item).include?(' ') }

# Print the results
folders_with_spaces.each do |folder|
  puts "Folder with spaces found: #{folder}"
  # You can perform additional actions here if needed
end
