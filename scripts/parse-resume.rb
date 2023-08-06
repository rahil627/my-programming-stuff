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
#f = File.read(filename)
#puts f
#f.chomp

#IO.foreach(filename) do |line|
#   if line.
#   puts line if (line[/ohn\b/])
#end

#positions_at_beginning_of_paragraphs = []
#positions_at_tags

lineno_at_beginning_of_item = 0
output = ""
concatenating = false;

File.open('dummy.txt') do |f|
   f.each_line do |line|

      if concatenating = true
         output += line

         if line.include?("####") && (f.lineno != lineno_at_beginning_of_item)
            # until the second #### line
               concatenating = false
            end
         end

         break
      end

      if line.include?("####")
         # f.rewind # rewind to beginning of line? or file?
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


#aFile = File.new(filename, "r")
#if not(aFile)
#   puts "Unable to open file!"

# File.readline("tags")