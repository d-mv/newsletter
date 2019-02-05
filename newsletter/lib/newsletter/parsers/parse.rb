# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'pry-byebug'
require_relative 'process_article'

class Parse
  def initialize(url)
    @url = url
    # auto fetch once started
    fetch
  end

  def fetch
    # binding.pry
    return false if @url == ''

    @raw_html = Nokogiri::HTML(open(@url).read)
  end

  def collect_articles
    # select which method is going to process
    method = 'parse_medium' unless @url.match('medium.').nil?
    # make array and process items
    array = []
    @raw_html.xpath('//item').each do |el|
      process = ProcessArticle.new
      result = process.send method, el
      array << result
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
