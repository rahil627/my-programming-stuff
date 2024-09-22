
# tree-sitter?
#   - hella complicated!!
#   - the the tree-sitter for markdown
  #   - https://github.com/tree-sitter-grammars/tree-sitter-markdown/blob/split_parser/tree-sitter-markdown/grammar.js

# ask ai:
# 1. write a custom markup parser that outputs html in ruby that uses the following syntax:
# (get syntax from my-markup-lang.txt)

# 2. write a custom markup parser in ruby using the jekyll "converter" parser that uses the following syntax:
# (get syntax from my-markup-lang.txt)


class MarkupParser
  def initialize(text)
    @text = text
  end

  def parse
    lines = @text.split("\n")
    result = []

    current_list = nil

    lines.each do |line|
      if line.start_with?("header:")
        # Extract the header (remove "header:" prefix)
        header = line.sub("header:", "").strip
        result << { type: :header, content: header }
        current_list = nil
      elsif line.start_with?("  - ")
        # Handle nested list items
        item = line.sub("  - ", "").strip
        current_list ||= []
        current_list << item
      end
    end

    # Add the last list (if any)
    result << { type: :list, content: current_list } if current_list

    result
  end
end

# Example usage:
input_text = <<~MARKUP
header:
lists
  - in
    - nested
  - format
MARKUP

parser = MarkupParser.new(input_text)
parsed_result = parser.parse

parsed_result.each do |item|
  if item[:type] == :header
    puts "Header: #{item[:content]}"
  elsif item[:type] == :list
    puts "List items:"
    item[:content].each { |li| puts "  - #{li}" }
  end
end
