# frozen_string_literal: true

require 'net/http'

class ProcessArticle
  # parsing medium
  def parse_medium(article)
    url = article.children.at('link').next_sibling.to_s
    # check if exists
    @posts = PostRepository.new
    return {} unless @posts.find_by_url(url).to_a.size.zero?

    art_raw = Nokogiri::HTML(Net::HTTP.get(URI.parse url))
    title = art_raw.children.at('title').text
    author = art_raw.children.at('meta[@property="author"]')['content']
    published = art_raw.children.at('meta[@property="article:published_time"]')['content']
    text = art_raw.xpath('//p').text
    words = art_raw.xpath('//p').text.split(' ').length
    puts url
    { title: title, url: url, author: author, published: published, text: text, words: words}
  end
end
