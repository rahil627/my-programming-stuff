#!/usr/bin/ruby

# generated by ai

require 'slop'
require 'wikipedia-client'

# Define CLI options using Slop
opts = Slop.parse do |o|
  o.string '-s', '--search', 'Search for a Wikipedia article'
  o.string '-g', '--get', 'Get the content of a specific Wikipedia article'
  o.on '--help', 'Prints the help' do
    puts o
    exit
  end
end

# Perform the requested action based on the option provided
if opts.search? # opts[:search]
  # Search for Wikipedia articles
  results = Wikipedia.find(opts[:search])
  results.each do |result|
    puts "#{result.title} - #{result.fullurl}"
  end
elsif opts.get? # opts[:get]
  # Get the content of a specific Wikipedia article
  article = Wikipedia.find(opts[:get])
  if article
    puts "Title: #{article.title}"
    puts "URL: #{article.fullurl}"
    puts "Content: #{article.text}"
  else
    puts "No article found for '#{opts[:get]}'"
  end
else
  puts opts
end

# Now, you can run the CLI app by executing the following command:
# ruby wiki_app.rb --help
# This will display the available options and usage instructions.

# To search for a Wikipedia article, you can use the -s or --search option followed by the search query. For example:
# ruby wiki_app.rb -s Ruby programming
# This will search for articles related to "Ruby programming" and display the titles and URLs of the matching articles.

# To get the content of a specific Wikipedia article, you can use the -g or --get option followed by the article title. For example:
# ruby wiki_app.rb -g Ruby_language
# This will fetch the content of the "Ruby language" article and display its title, URL, and content.
