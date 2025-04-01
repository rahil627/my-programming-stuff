#!/usr/bin/env ruby

# ai prompt
# write a web crawler using ruby to search hacker news web site for jobs that use ruby or elixir (can be combined with C, and other systems programming langs)


require 'nokogiri'
require 'open-uri'

def crawl_hacker_news_jobs(keywords)
  url = 'https://news.ycombinator.com/jobs'
  begin
    doc = Nokogiri::HTML(URI.open(url))
    jobs = doc.css('.athing')

    jobs.each do |job|
      title_element = job.at_css('.title a')
      next unless title_element

      title = title_element.text.downcase
      job_url = title_element['href']

      if keywords.any? { |keyword| title.include?(keyword) }
        puts "Title: #{title}"
        puts "URL: #{job_url}"
        puts "---"
      end
    end
  rescue OpenURI::HTTPError => e
    puts "Error fetching URL: #{e.message}"
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end
end

keywords = ['ruby', 'elixir', 'c'] # Add any other relevant keywords

crawl_hacker_news_jobs(keywords)

#Optionally, crawl the next pages. Hackernews jobs pages use a 'more' link.

def crawl_hacker_news_jobs_multiple_pages(keywords, max_pages = 5) #Limit crawl to avoid overwhelming server.
    url = 'https://news.ycombinator.com/jobs'
    page_count = 0
    begin
        while url && page_count < max_pages do
            page_count += 1
            puts "Crawling page #{page_count}..."
            doc = Nokogiri::HTML(URI.open(url))
            jobs = doc.css('.athing')

            jobs.each do |job|
                title_element = job.at_css('.title a')
                next unless title_element

                title = title_element.text.downcase
                job_url = title_element['href']

                if keywords.any? { |keyword| title.include?(keyword) }
                    puts "Title: #{title}"
                    puts "URL: #{job_url}"
                    puts "---"
                end
            end
            more_link = doc.at_css('a[rel="next"]')
            url = more_link ? "https://news.ycombinator.com/#{more_link['href']}" : nil
        end
    rescue OpenURI::HTTPError => e
        puts "Error fetching URL: #{e.message}"
    rescue StandardError => e
        puts "An error occurred: #{e.message}"
    end
end
crawl_hacker_news_jobs_multiple_pages(keywords)
