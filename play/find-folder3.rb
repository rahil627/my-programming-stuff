#!/usr/bin/env ruby

require 'optparse'

# Initialize options
options = {}

# Define the OptionParser
OptionParser.new do |opts|
  opts.banner = "Usage: folder_checker.rb [options]"

  opts.on("-d", "--directory DIRECTORY", "Specify the root directory to search for folders") do |dir|
    options[:root_directory] = dir
  end

  opts.on("-h", "--help", "Show this help message") do
    puts opts
    exit
  end
end.parse!

# Validate input
unless options[:root_directory]
  puts "Error: Please provide a root directory using the -d option."
  exit 1
end

# Recursively find folders with spaces
def find_folders_with_spaces(directory)
  Dir.glob(File.join(directory, '**/*'))
     .select { |item| File.directory?(item) && File.basename(item).include?(' ') }
end

# Main logic
folders_with_spaces = find_folders_with_spaces(options[:root_directory])
if folders_with_spaces.empty?
  puts "No folders with spaces found in #{options[:root_directory]}."
else
  puts "Folders with spaces found in #{options[:root_directory]}:"
  folders_with_spaces.each { |folder| puts folder }
end
