#!/usr/bin/env ruby

# job listing scraper script

# TODO: i wrote this offline, it's just pseudo-code..

require 'nokogiri'
require 'open-uri'

# load sites
# could make these arguments for a general scraper shell program, then write a shell script
sites = [] # site data used to scrape
  # an array of hash-maps

# NOTE: for the selector, aim for grabbing the all of the data, as you can easily skim it
#  - job title, location, short description

sites << { uri: 'http://job.sites', selector: 'h4 a.l'}
# NOTE: the best jobs are on that rails site
sites << { uri: 'madewithindies', selector: 'h4 a.l'}
sites << { uri: 'hnhiring', selector: 'h4 a.l'}
sites << { uri: 'remoteok', selector: 'h4 a.l'}
sites << { uri: 'craigslist', selector: 'h4 a.l'}
sites << { uri: 'zensearch', selector: 'h4 a.l'}
  - # might include linkedin..
# sites << { uri: 'linkedin', selector: 'h4 a.l'}
# sites << { uri: 'UC', selector: 'h4 a.l'}
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

