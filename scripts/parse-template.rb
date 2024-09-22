
# could also use erb or liquid gems and do it in two lines, but then requires a gem, besides, need to get better at reg-ex!!

# write me short 'n sweet ruby script that parses the templates in the common format "{{ variable1 }}, {{ variable2 }}, {{ variable3 }}...", given a data structure to set those variables, please.
def parse_template(template, variables)
  # ai is soooo good for reg ex!
  template.gsub(/\{\{(\s*[\w\d_]+\s*)\}\}/) do |match|
    variable_name = match[2..-3].strip
    variables[variable_name] || match
  end
end

# Example usage:
template_string = "Hello, {{ name }}! Today is {{ day }}."
data = {  "name" => "Alice",  "day" => "Monday"}

parsed_result = parse_template(template_string, data)puts parsed_result






