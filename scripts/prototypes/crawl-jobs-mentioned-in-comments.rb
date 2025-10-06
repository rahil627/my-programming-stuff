#!/usr/bin/env ruby


# TODO: homework
# is error handling in ruby worth using?
# get better at using data.map..

# TODO:
# 2000 char limit?

# to notes:
# TODO: setup emacs/ruby to navigate libs easily
# TODO: spc-c overlaps with spc for most of the sub-keymaps.. ffs emacs..
# inf-ruby, spc-c-s
# require 'lib' # as needed
# spc-c-d
#   - robe-doc
#   - TODO: should be k
#   - spc-k-d
#     - somehow finds it definitions in the ruby libs!
# the docs can have links
#
# TODO: get better at folding/un-folding code
# need something like org mode.. or maybe a code-tree plugin?
#
# Nokogiri::XML::Element
# e.name
# e.attributes
# e.text.strip

# ai prompt
# write a web crawler using ruby to search hacker news web site for jobs that use ruby or elixir (can be combined with C, and other systems programming langs)
# the hacker news site has a list of links, i want the program to crawl each link, and print the job descriptions, interactively, one by one, after the user presses a key, starting from the top-most link
# generalize fetch_job_description to scrape all text from the page

#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'io/console' # Required for getting user input

def extract_job_urls
  url = 'https://news.ycombinator.com/jobs'
  begin
    doc = Nokogiri::HTML(URI.open(url))
    job_links = doc.css('.athing .title a[href^="http"]') # Get absolute URLs

    job_data = job_links.map do |link|
      { url: link['href'], text: link.text.strip }
    end

    job_data.compact.uniq
  rescue OpenURI::HTTPError => e
    puts "Error fetching URL: #{e.message}"
    return []
  rescue StandardError => e
    puts "An error occurred while extracting URLs and text: #{e.message}"
    return []
  end
end

def fetch_all_text(url)
  begin
    doc = Nokogiri::HTML(URI.open(url))
    # Target the main content area, usually the body
    body_content = doc.at_css('body')
    if body_content
      # Extract all text content and clean up whitespace
      text = body_content.text.strip.gsub(/\s+/, ' ')
      return text
    else
      return "Could not find body content."
    end
  rescue OpenURI::HTTPError => e
    puts "Error fetching URL #{url}: #{e.message}"
    return "Could not fetch page."
  rescue StandardError => e
    puts "An error occurred while fetching text from #{url}: #{e.message}"
    return "Could not fetch page."
  end
end

def interactive_crawl(job_data)
  if job_data.empty?
    puts "No job URLs found on the Hacker News jobs page."
    return
  end

  job_data.each_with_index do |job, index|
    puts "\n--- Job #{index + 1} of #{job_data.count} ---"
    puts "Anchor Text: #{job[:text]}"
    puts "Fetching all text from: #{job[:url]}"
    all_text = fetch_all_text(job[:url])
    puts "\nAll Text:\n#{all_text[0..2000]}#{'...' if all_text.length > 2000}\n" # Limit output
    print "Press any key to view the next job (or Ctrl+C to exit)..."
    STDIN.getch
    puts "" # Add a newline
  end

  puts "\n--- End of Pages ---"
end

if __FILE__ == $0
  puts "Fetching job links and text from https://news.ycombinator.com/jobs..."
  job_data = extract_job_urls()

  if job_data.any?
    puts "Found #{job_data.count} job links."
    interactive_crawl(job_data)
  else
    puts "No job URLs found."
  end
end
