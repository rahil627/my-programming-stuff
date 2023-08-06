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

position_at_beginning_of_paragraph = 0
output = ""
concatenating = false;
#c = 0

File.open('dummy.txt') do |f|
   f.each_line do |line|
      if concatenating = true
         output += line

         if line.include?("####") && (f.pos != position_at_beginning_of_paragraph)
            # until the second #### line
            #c++
            
            #if c == 2
               concatenating = false
              # c = 0
               break
            end
         end
      end

      if line.include?("####")
         # f.rewind # rewind to beginning of line? or file?
         position_at_beginning_of_paragraph = f.pos
      end

      if line.include?("tags: ")
         if line.include?(input)
            f.pos = position_at_beginning_of_paragraph
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