# frozen_string_literal: true

class PostsRefresh

  def initialize
    puts '+ PostsRefresh init'
  end

  def fill
    @sources = SourceRepository.new.all
    get_the_posts unless @sources.nil?
  end

  # fill the db with posts
  def get_the_posts
    @posts = PostRepository.new
    @sources.each do |el|
      puts el.url
      parsing = Parse.new(el.url)
      articles = parsing.collect_articles
      articles.each do |art|
        art[:source_id] = el.id
        check = @posts.find_by_url(art[:url]).to_a.size
        @posts.create(art) if check.zero?
      end
    end
  end
end
