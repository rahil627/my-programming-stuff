# nvm, just use grep.. which is literally what i needed: (g)lobal (r)egular (e)xpression search and (p)rint

# ask ai:
# write a ruby script that parses and prints the lines that contain the format "WORD:" or "TODO:" or "WARNING:" out of files and/or folders recursively given an input path via cli arguments

def process_file(file_path)
  File.open(file_path, "r") do |file|
    file.each_line do |line|
      if line.match?(/(WORD|TODO|WARNING):/)
        puts line.chomp
      end
    end
  end
end

def process_directory(directory_path)
  Dir.glob(File.join(directory_path, "**/*")).each do |entry|
    next if File.directory?(entry)

    process_file(entry)
  end
end

def main
  input_path = ARGV[0] # NOTE: i really like this over the complex std lib OptionsParser!!

  if input_path.nil?
    puts "Usage: ruby word_todo_warning_parser.rb <input_path>"
    exit 1
  end

  if File.directory?(input_path)
    process_directory(input_path)
  elsif File.file?(input_path)
    process_file(input_path)
  else
    puts "Invalid input path. Please provide a valid file or directory path."
    exit 1
  end
end

main
