require 'slop'

# functions
def generate_table_of_contents(lines)
  toc = []

  lines.each do |line|
    if line.match(/^#+\s+(.+)/)
      header = $1
      level = line.scan(/^#+/).first.length
      toc << { level: level, title: header.strip }
    end
  end

  return toc
end

def format_table_of_contents(toc)
  formatted_toc = "# Table of Contents\n\n"

  toc.each do |item|
    indent = "  " * (item[:level] - 1)
    formatted_toc += "#{indent}- [#{item[:title]}](##{item[:title].downcase.gsub(/\s+/, '-')})\n"
  end

  return formatted_toc
end

# parse command line options
opts = Slop.parse do |o|
  o.banner = "Usage: ruby script.rb [options]"

  o.string '-i', '--input', 'Input Markdown file (or use stdin if omitted)'
  o.string '-o', '--output', 'Output table of contents file (or use stdout if omitted)'
  o.string '-t', '--top-insert', 'Insert table of contents at the top of the specified file'
end

# main
input_lines = if opts[:input]
                if opts[:input] == '-' # TODO: or empty?
                  $stdin.readlines
                else
                  File.readlines(opts[:input])
                end
              else
                ARGF.readlines
              end

table_of_contents = generate_table_of_contents(input_lines)
formatted_toc = format_table_of_contents(table_of_contents)

if opts[:top_insert]
  file_contents = File.read(opts[:top_insert])
  new_file_contents = formatted_toc + "\n\n" + file_contents
  File.write(opts[:top_insert], new_file_contents)
  puts "Table of contents inserted at the top of '#{opts[:top_insert]}'"
elsif opts[:output]
  output_target = opts[:output] == '-' ? $stdout : File.open(opts[:output], 'w')
  output_target.puts("# Table of Contents\n\n")
  output_target.puts(formatted_toc)
  output_target.close unless output_target == $stdout
  puts "Table of contents generated and saved as '#{opts[:output]}'"
else
  puts formatted_toc
end
