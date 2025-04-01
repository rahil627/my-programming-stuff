#!/usr/bin/env ruby

# TODO: un-tested

# ai prompts:
# using ruby and nokogiri, scrape job posts from the following sites: rubyonremote, workwithindies, hnhiring, workatastartup, remoteok, craigslist, careerspub.universityofclaifornia.edu, elixirjobs.net
# now abstract the data and do it in a loop
# try to get the most data by it making a single simple selector

module Ra::Scraper # TODO: can you have just a module of functions (instead of classes?)

require 'nokogiri'
require 'open-uri'
require 'uri'

# "private"
def scrape url, job_selector, text_selector, link_selector, link_prefix = ''
  begin
    doc = Nokogiri::HTML(URI.open(url))
    jobs = doc.css(job_selector)
    jobs.map do |job|
      text = job.css(text_selector).map(&:text).join(' | ').strip # Combine all text
      link = link_prefix + job.css(link_selector).attribute('href').value rescue nil # Handle missing links
      { text: text, link: link }
    end
  rescue StandardError => e
    puts "Error scraping #{url}: #{e.message}"
    []
  end
end

# "public"
# input is an array of hashes
def scrape_data site_data
  @site_data.each do |site|
    puts "Scraping #{site[:name]}..."
    data_bunches = scrape( # TODO: formatting confusing
      site[:url],
      site[:job_selector],
      site[:text_selector],
      site[:link_selector],
      site[:link_prefix]
    )

    data_bunches.each do |job|
      puts "  Text: #{job[:text]}, Link: #{job[:link]}"
    end
  end

  # puts "University of California: Scraping this site is complex and requires JS handling."
end

end




# begin script

include Ra::Scraper # TODO: can i just import a single function?
  # do at the beginning as opposed to inline

# fold me!
site_data = [
  {
    name: 'RubyOnRemote',
    url: 'https://rubyonremote.com/',
    job_selector: '.job-listing',
    text_selector: '*', # Select all elements within the job listing
    link_selector: 'h2 a'
  },
  {
    name: 'WorkWithIndies',
    url: 'https://www.workwithindies.com/',
    job_selector: '.job-listing',
    text_selector: '*',
    link_selector: 'h2 a'
  },
  {
    name: 'HnHiring',
    url: 'https://hnhiring.com/',
    job_selector: '.job',
    text_selector: '*',
    link_selector: '.title a'
  },
  {
    name: 'WorkAtAStartup',
    url: 'https://workatastartup.com/jobs/',
    job_selector: '.job-listing',
    text_selector: '*',
    link_selector: 'h2 a'
  },
  {
    name: 'RemoteOK',
    url: 'https://remoteok.io/',
    job_selector: '.job',
    text_selector: '*',
    link_selector: 'a',
    link_prefix: 'https://remoteok.io'
  },
  {
    name: 'Craigslist',
    url: 'https://sfbay.craigslist.org/search/sof',
    job_selector: '.result-row',
    text_selector: '*',
    link_selector: '.result-title',
    link_prefix: 'https://sfbay.craigslist.org'
  },
  {
    name: 'ElixirJobs',
    url: 'https://elixirjobs.net/',
    job_selector: '.job-listing',
    text_selector: '*',
    link_selector: 'h2 a'
  }
]

Scraper.scrape_data site_data
