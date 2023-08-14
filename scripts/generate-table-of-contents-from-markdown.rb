if ARGV.length != 1
    puts "Usage: ruby script.rb <markdown_file>"
    exit 1
  end
  
  markdown_file_path = ARGV[0]
  
  unless File.exist?(markdown_file_path)
    puts "File not found: #{markdown_file_path}"
    exit 1
  end
  

def generate_table_of_contents(file_path)
    toc = []
    
    File.foreach(file_path) do |line|
      if line.match(/^#+\s+(.+)/)
        header = $1
        level = line.scan(/^#+/).first.length
        toc << { level: level, title: header.strip }
      end
    end
  
    return toc
  end
  
  def format_table_of_contents(toc)
    formatted_toc = ""
    
    toc.each do |item|
      indent = "  " * (item[:level] - 1)
      formatted_toc += "#{indent}- [#{item[:title]}](##{item[:title].downcase.gsub(/\s+/, '-')})\n"
    end
  
    return formatted_toc
  end
  
  table_of_contents = generate_table_of_contents(markdown_file_path)
  formatted_toc = format_table_of_contents(table_of_contents)
  
  File.open(markdown_file_path, "w") do |file|
    # TODO: does this insert at the end?
    file.puts("# Table of Contents\n\n")
    file.puts(formatted_toc)
  end
  
  puts "Table of contents generated and saved as #{markdown_file_path}"
  