# frozen_string_literal: true

require 'pry-byebug'
class PostRepository < Hanami::Repository

  # launch the posts fetching
  def fill
    @sources = SourceRepository.new.all
    get_the_posts unless @sources.nil?
    # binding.pry
  end

  # fill the db with posts
  def get_the_posts
    @posts = PostRepository.new
    @sources.each do |el|
      parsing = Parse.new(el.url)
      articles = parsing.collect_articles
      articles.each do |art|
        art[:source_id] = el.id
        @posts.create(art)
      end
    end
    # binding.pry
  end

end
