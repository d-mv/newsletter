# frozen_string_literal: true

# require 'open-uri'
# require 'nokogiri'
# require 'pry-byebug'
require 'net/http'
require_relative 'process_article'

class Parse
  def initialize(url)
    @url = url
    # auto fetch once started

  end

  def fetch
    # binding.pry
    return false if @url == ''

    # binding.pry
    # url_text = Net::HTTP.new(URI.parse @url)
    # url_text.use_ssl = true
    # url_text.verify_mode = OpenSSL::SSL::VERIFY_NONE

# Net::HTTP.start(@url, 443, use_ssl: true)

# http = Net::HTTP.start(@url, 443, use_ssl: true)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    html = Net::HTTP.get(URI.parse @url)
    @raw_html = Nokogiri::HTML(html)
    # binding.pry
  end

  def collect_articles
    # select which method is going to process
    # binding.pry
    puts "Starting collecting..."
    fetch
    method = 'parse_medium' unless @url.match('medium.').nil?
    array = []

    @raw_html.xpath('//item').each do |el|
      # binding.pry
      process = ProcessArticle.new

      result = process.send method, el
      array << result if result != {}

    end
    # binding.pry
    array
  end
end

# url_to_parse = 'https://freecoursesite.com'
# url_to_parse = 'https://tutsgalaxy.com/'
# url_to_parse = 'https://medium.freecodecamp.org/feed'
# parsing = Parse.new(url_to_parse)

# parsing.collect_articles
