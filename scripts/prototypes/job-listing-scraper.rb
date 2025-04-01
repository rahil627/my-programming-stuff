#!/usr/bin/env ruby

# job listing scraper script

# the goal: just list a bunch of jobs that i can easily skim through

# TODO: i wrote this offline, it's just pseudo-code..
# TODO: try adding to github actions

require 'nokogiri'
require 'open-uri'

# load sites
# could make these arguments for a general scraper shell program, then write a shell script
sites = [] # site data used to scrape
  # an array of hash-maps

# NOTE: for the selector, aim for grabbing the all of the data, as you can easily skim it
#  - job title, location, short description

# TODO: try fetching from [job_search_notes.org]?
# NOTE: the best jobs are within companies listed on usingrails.com
#   - TODO: scraping that site would be epic..

# main list
sites << { uri: 'rubyonremote.com', selector: 'h4 a.l'}
sites << { uri: 'workwithindies', selector: 'h4 a.l'}
sites << { uri: 'hnhiring', selector: 'h4 a.l'}
sites << { uri: 'workwithastartup? whatever new hn site..', selector: 'h4 a.l'}
sites << { uri: 'remoteok', selector: 'h4 a.l'}
sites << { uri: 'craigslist', selector: 'h4 a.l'}

# sites << { uri: 'UC', selector: 'h4 a.l'}
# sites << { uri: 'edjoin', selector: 'h4 a.l'}

# sites << { uri: 'elixirjobs.net', selector: 'h4 a.l'}
  # when i get the experience.. :/

# can use deep filters with these aggregator sites
# sites << { uri: 'zensearch', selector: 'h4 a.l'}
# sites << { uri: 'levels.fyi', selector: 'h4 a.l'}

# sites << { uri: 'linkedin', selector: 'h4 a.l'}
  # the aggregator sites might already include linkedin, indeed, etc..

  # god i love hash-maps.. i can see why Matz chose it as the main data structure..

  
target_content = ""

# get jobs
sites.each do |s|
  # get a Nokogiri::HTML4::Document for the page we’re interested in...
  doc = Nokogiri::HTML4(URI.open(s.uri))

  target_content << "scraped from ", s.uri, "\n"
  
  # do funky things with it using Nokogiri::XML::Node methods...
  # search for nodes by css
  doc.css(s.selector).each do |link|
    puts link.target_content
    target_content << link.content
  end
end

# write jobs
File.open("_jobs.txt") do |f|
  # puts f.gets
  f.write("--- beginning of scraping session --- \n")
  f.write(target_content, "\n") # appends
  f.write("--- end of scraping session --- \n\n\n\n\n\n\n")
end

