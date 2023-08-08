#!/usr/bin/ruby

filename = "Gemfile"
tags = ["hospitality", "tech", "community"]

# console part
puts tags
puts "enter one of the above"
input = gets.chomp # very important to "chonp" newlines!

puts input

if (not(tags.include?(input)))
   throw "input was wrong"
end


# https://www.tutorialspoint.com/ruby/ruby_input_output.htm

#IO.foreach(filename) do |line|
#   if line.
#   puts line if (line[/ohn\b/])
#end

def read_and_output_string(filename)
   lineno_at_beginning_of_item = 0
   output = ""
   concatenating = false

   File.open(filename) do |f| # auto closes the file this way at the end of the block
      f.each_line do |line| # vs f.gets

         if concatenating == true
            output += line

            if line.include?("####") && (f.lineno != lineno_at_beginning_of_item)
                  # until the second #### line
                  concatenating = false
            end

            break
         end

         if line.include?("####")
            lineno_at_beginning_of_item = f.lineno
         end

         if line.include?("tags: ")
            if line.include?(input)
               f.lineno = lineno_at_beginning_of_item
               concatenating = true;
            end
         end
         p "position=#{f.pos} eof?=#{f.eof?} lineno=#{f.lineno}"
         
      end
   end

   return output
end


out = read_and_output_string(filename)

File.write('output.txt', out)

puts File.read('output.txt')
