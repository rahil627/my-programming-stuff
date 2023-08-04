#!/usr/bin/ruby

# https://www.tutorialspoint.com/ruby/ruby_input_output.htm
aFile = File.new("input.txt", "r")
if aFile
   content = aFile.sysread(20)
   puts content
else
   puts "Unable to open file!"
end

