# frozen_string_literal: true

require 'eat'
require 'nokogiri'
require 'pry-byebug'

class Parse
  def initialize(url)
    return false if url == ''

    @url = url
    fetch
  end

  def fetch
    # binding.pry
    @raw_html = Nokogiri::HTML(eat(@url))
  end

  def find_feed
    @feed_url = @raw_html.at("link[type='application/rss+xml']")['href']
    @feed_raw = Nokogiri::XML(eat(@feed_url))
    array = []
    feed = []
    @feed_raw.xpath('//item').each { |el| array << el }
    array.each do |el|
      title = el.at('title').to_s.match(/>(.*)</)[1].strip
      link = el.at('link').to_s.match(/>(.*)</)[1].strip
      pub_date = el.at('pubDate').to_s.match(/>(.*)</)[1].strip
      site = link.match(%r{//(.*)/\S})[1].strip
      author = el.at('author').to_s.match(/>(.*)</)
      author = author.nil? ? site : author[1].strip
      content = parse_article(link)
      feed << [title, link, pub_date, author, content[0], content[1]]
    end
    return feed
  end

  def parse_article(link)
    raw = Nokogiri::HTML(eat(link))
    [raw.xpath('//p').text.strip, raw.xpath('//p').text.strip.split(' ').size]
  end

  def medium
    # url, title, content, author, read
    content = medium_parse_article
    # author = Author.new
    author = { nickname: @html.at('link[@rel="author"]')['href'].match(/@(.*)$/)[1] }
    author[:name] = @html.at('meta[@property="author"]')['content']
    @url = @html.at('link[@rel="author"]')['href']
    author.merge!(medium_parse_author(author))
    # binding.pry
    [author, content]
  end

  def medium_parse_article
    block = @html.css('.sectionLayout--insetColumn')
    content = { url: @url }
    content[:title] = @html.title
    content[:content] = block.css('p.graf.graf--p').text
    content
  end

  def medium_parse_author(author)
    fetch
    # desc
    author[:description] = @html.xpath('//p')[0].text
    buttons = @html.xpath('//a[@class="button button--chromeless u-baseColor--buttonNormal"]')[0]
    author[:following] = buttons.attr('title').split(' ')[1].delete(',').to_i
    buttons = @html.xpath('//a[@class="button button--chromeless u-baseColor--buttonNormal"]')[1]
    author[:followers] = buttons.attr('title').split(' ')[1].delete(',').to_i
    author
  end
end

# url_to_parse = 'https://freecoursesite.com'
# url_to_parse = 'https://tutsgalaxy.com/'
# parsing = Parse.new(url_to_parse)

# parsing.find_feed
