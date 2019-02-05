# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'pry-byebug'

class ProcessArticle
  # parsing medium
  def parse_medium(article)
    url = article.children.at('link').next_sibling.to_s
    art_raw = Nokogiri::HTML(open(url).read)
    title = art_raw.children.at('title').text
    author = art_raw.children.at('meta[@property="author"]')['content']
    published = art_raw.children.at('meta[@property="article:published_time"]')['content']
    text = art_raw.xpath('//p').text
    words = art_raw.xpath('//p').text.length
    # brief = art_raw.xpath('//p').text[0..1000]
    # uid = "#{published}#{title}"
    { title: title, url: url, author: author, published: published, text: text, words: words}
  end
end
