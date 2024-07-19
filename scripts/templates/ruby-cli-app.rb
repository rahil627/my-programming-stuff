#!/usr/bin/env ruby

# prompt to microsoft copilot:
# make a template cli app in ruby taking input

require 'optparse'

# Initialize options (you can add more as needed)
options = {}

# Define the OptionParser
OptionParser.new do |opts|
  opts.banner = "Usage: my_cli_app.rb [options]"

  opts.on("-f", "--first-name FIRSTNAME", "Specify the first name") do |first_name|
    options[:first_name] = first_name
  end

  opts.on("-l", "--last-name LASTNAME", "Specify the last name") do |last_name|
    options[:last_name] = last_name
  end

  # Add more options here if necessary

  opts.on("-h", "--help", "Show this help message") do
    puts opts
    exit
  end
end.parse!

# Validate input (you can customize this part)
unless options[:first_name] && options[:last_name]
  puts "Error: Please provide both first name (-f) and last name (-l)."
  exit 1
end

# Your main logic here (e.g., greet the user)
puts "Hello, #{options[:first_name]} #{options[:last_name]}!"

# Add more functionality as needed
