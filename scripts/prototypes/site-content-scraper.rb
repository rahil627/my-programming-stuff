#!/usr/bin/env ruby


# ai prompt:
# using ruby and roda, make a web site that inputs a URL, usually of popular cooking websites full of ads, and scrape the recipe and media (photos, video) content from it
#  - TODO: try sinatra instead..

# write a function that scrapes all the titles and descriptions from a YouTube channel (using ruby/roda web app above)

# combine the apps

# combine the erb/views to a single page
  # rename the single erb/view to the default name (index?)

# use a switch instead of conditional if/else for the main url matching part, with the last else being the general site scraper function



# needs some prompt engineering..
# just scrape text,
# TODO: test chrome reading mode.. that may be what i'm going for here..
#   - i remember it works really well on the phone..
#   - NOTE: yeah, put this on the backburner..

# can't rely on css name
#   - look for "ingredients" in css/DOM, and "ingredients" in the text

# hmmm, nowadays, and especially in more social places such as Taiwan, people are more likely to post videos on youtube, so you must scrape from youtube's descriptions
# TODO: this is a simpler, more practical start
#   - create a new function for this
#   - use rosalina's kitchen as an example
#     - https://www.youtube.com/channel/UCcb9uxCoIgw7RQjQnlgd0Xw



# this is very good web practice, it's the quintessential CRUD app!
# + some web-scraping action!
# it's also a perfect test comparison for haxe for web (via ai, lol)
#   - and python (flask, django) and javascript (i don't even know..) too


# goal:
# input: web-site
# output: output stream (for unix/cli) or yaml file or web-page


# this has some implementation problems..
# ...this is the sort of task ai is very good at.. but then that would cost ai compute..
# TODO: 1. build an ai agent?
# could try building an ai-agent that does this..
#   - test on serveral sites (youtube, tiktok?, various basic web-sites)
#     - test multiple languages!!
#       - okay, this is very ai is really needed and good at..!!
#   - improve it, until the output is good enough
#   - then tell it to write the program down, in ruby (and haxe, jai, python, js)


# zero project: output to stream, for simple cli testing

# first project: output via a web page, so anyone can use it (: recipe scraper!)

# second project: output to yaml file, in order to build a database for a seperate site


# 2. save data to a simple database (a yaml file)

# 3. create a simple CRUD app using phoenix or rails
#   - TODO: is sinatra or roda okay for CRUD apps?
#     - can it be done with a yaml file? or do you already need a database?
#       - ..i think the advanced search function alone would require a yaml db adapter or something..
#   - search
#     - advanced
#       - by ingredient
#   - provide link to source: video, tiktok, web-site

# need own server (and domain)
#   - (can't do via github pages ;( )



# To run this code:

# Install dependencies:
# gem install roda nokogiri
# Save the code: Save the code as a .rb file (e.g., recipe_scraper_roda.rb).
# Create a views directory: Create a directory named views in the same location as your .rb file.
# Create view files: Copy the index.erb and recipe.erb code into files named index.erb and recipe.erb, respectively, inside the views directory.
# Run the server:
# rackup recipe_scraper_roda.rb
# Open in browser: Open your web browser and go to http://localhost:9292.
# Enter URL: Enter the URL of a recipe website in the form and click "Scrape Recipe."


require 'roda'
require 'nokogiri'

require 'open-uri'
require 'uri'
require 'fileutils'
require 'json'

class WebScraper < Roda
  plugin :render, views: 'views'
  plugin :public, root: 'public'

  def scrape_recipe(url)
    begin
      html = URI.open(url).read
      doc = Nokogiri::HTML(html)

      doc.search()

      title = doc.css('h1').text.strip
      ingredients = doc.css('.wprm-recipe-ingredients li').map(&:text).map(&:strip)
      instructions = doc.css('.wprm-recipe-instructions li').map(&:text).map(&:strip)
      images = doc.css('img').map { |img| img['src'] }.compact.select { |src| src.match?(/\.(jpg|jpeg|png|gif)/i) }
      videos = doc.css('iframe').map { |iframe| iframe['src'] }.compact.select { |src| src.match?(/youtube|vimeo/i) }

      recipe = {
        title: title,
        ingredients: ingredients,
        instructions: instructions,
        images: images,
        videos: videos,
      }

      return recipe
    rescue OpenURI::HTTPError => e
      puts "Error fetching URL: #{e.message}"
      return nil
    rescue StandardError => e
      puts "An unexpected error occurred: #{e.message}"
      return nil
    end
  end

  def download_media(media_urls, base_dir)
    media_urls.each_with_index do |url, index|
      begin
        uri = URI.parse(url)
        filename = File.join(base_dir, File.basename(uri.path))

        FileUtils.mkdir_p(base_dir)

        URI.open(url) do |image_file|
          File.open(filename, 'wb') do |file|
            IO.copy_stream(image_file, file)
          end
        end
        puts "Downloaded: #{filename}"
      rescue StandardError => e
        puts "Failed to download #{url}: #{e.message}"
      end
    end
  end

  def scrape_youtube_channel(channel_url)
    begin
      html = URI.open(channel_url).read
      doc = Nokogiri::HTML(html)

      initial_data = doc.at('script[type="application/json"][data-name="initialData"]&.text').text rescue nil
      if initial_data
        data = JSON.parse(initial_data)
        videos = data.dig("contents", "twoColumnBrowseResultsRenderer", "tabs", 0, "tabRenderer", "content", "sectionListRenderer", "contents", 0, "itemSectionRenderer", "contents", 0, "gridRenderer", "items") || []
        results = videos.map do |video|
          video_data = video["gridVideoRenderer"]
          {
            title: video_data&.dig("title", "runs", 0, "text"),
            description: video_data&.dig("descriptionSnippet", "runs", 0, "text"),
            video_id: video_data["videoId"]
          }
        end
        return results.compact
      else
        videos = doc.css('ytd-grid-video-renderer')

        results = videos.map do |video|
          title = video.at_css('#video-title')&.text&.strip
          description = video.at_css('#description-text')&.text&.strip
          video_id = video.at_css("#thumbnail")['href'].gsub("/watch?v=", "") rescue nil
          { title: title, description: description, video_id: video_id }
        end.compact
        return results
      end
    rescue OpenURI::HTTPError => e
      puts "Error fetching URL: #{e.message}"
      return nil
    rescue JSON::ParserError => e
      puts "JSON Parsing Error: #{e.message}"
      return nil
    rescue StandardError => e
      puts "An unexpected error occurred: #{e.message}"
      return nil
    end
  end

  route do |r|
    r.root do
      view 'index'
    end

    r.post 'scrape' do
      if r.params['url'] && r.params['url'].include?("youtube")
        results = scrape_youtube_channel(r.params['url'])
        if results
          view 'index', youtube_results: results
        else
          view 'index', youtube_error: "Failed to scrape YouTube channel."
        end
      else
        recipe = scrape_recipe(r.params['url'])
        if recipe
          media_dir = File.join('public', recipe[:title].gsub(/[^a-zA-Z0-9\s]/, '').gsub(/\s+/, '_'))
          download_media(recipe[:images], media_dir)
          view 'index', recipe: recipe
        else
          view 'index', recipe_error: "Failed to scrape recipe from the provided URL."
        end
      end
    end
  end
end

__END__

views/index.erb
<!DOCTYPE html>
<html>
<head><title>Web Scraper</title></head>
<body>
  <h1>Web Scraper</h1>
  <form action="/scrape" method="post">
    <label for="url">Enter URL:</label><br>
    <input type="text" id="url" name="url"><br><br>
    <input type="submit" value="Scrape">
  </form>

  <% if recipe %>
    <h1><%= recipe[:title] %></h1>
    <h2>Ingredients:</h2>
    <ul><% recipe[:ingredients].each do |ingredient| %><li><%= ingredient %></li><% end %></ul>
    <h2>Instructions:</h2>
    <ol><% recipe[:instructions].each do |instruction| %><li><%= instruction %></li><% end %></ol>
    <h2>Images:</h2>
    <% recipe[:images].each do |image| %><% filename = File.basename(URI.parse(image).path) %><img src="<%= File.join(recipe[:title].gsub(/[^a-zA-Z0-9\s]/, '').gsub(/\s+/, '_'), filename) %>" alt="Recipe Image" style="max-width: 300px;"><br><% end %>
    <h2>Videos:</h2>
    <ul><% recipe[:videos].each do |video| %><li><a href="<%= video %>" target="_blank"><%= video %></a></li><% end %></ul>
  <% elsif recipe_error %>
    <p style="color: red;"><%= recipe_error %></p>
  <% end %>

  <% if youtube_results && youtube_results.any? %>
    <h1>YouTube Channel Results</h1>
    <ul>
      <% youtube_results.each do |video| %>
        <li>
          <strong>Title:</strong> <%= video[:title] %><br>
          <strong>Description:</strong> <%= video[:description] %><br>
          <strong>Video ID:</strong> <%= video[:video_id] %><br>
          <iframe width="560" height="315" src="https://www.youtube.com/embed/<%= video[:video_id] %>" frameborder="0" allowfullscreen></iframe>
        </li>
      <% end %>
    </ul>
  <% elsif youtube_error %>
    <p style="color: red;"><%= youtube_error %></p>
  <% end %>

</body>
</html>
