# frozen_string_literal: true

require 'net/http'
require_relative 'process_article'

class Parse
  def initialize(url)
    @url = url
  end

  def fetch
    return false if @url == ''

    html = Net::HTTP.get(URI.parse @url)
    @raw_html = Nokogiri::HTML(html)
  end

  def collect_articles
    puts "Starting collecting..."
    fetch
    method = 'parse_medium' unless @url.match('medium.').nil?
    array = []

    @raw_html.xpath('//item').each do |el|
      process = ProcessArticle.new
      result = process.send method, el
      array << result if result != {}
    end
    array
  end
end