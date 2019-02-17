# frozen_string_literal: true

class PostsRefresh
  # launch the posts fetching
  def initialize
    puts '+ PostsRefresh init'
  end

  def fill
    # puts 'Start -fill'
    # puts 'new SourceRepository'
    @sources = SourceRepository.new.all
    # puts 'run get_posts'
    get_the_posts unless @sources.nil?
    # binding.pry
  end

  # fill the db with posts
  def get_the_posts
    # puts '+ Start -get_the_posts'
    @posts = PostRepository.new
    # puts '+ loop sources'
    @sources.each do |el|
      # puts '+ start parse class'

      puts el.url
      parsing = Parse.new(el.url)
      # puts '+ run parsing_collect_articles'
      articles = parsing.collect_articles
      # puts '+ go through articles'
      articles.each do |art|
        # puts @posts.find(art[:uid])
        art[:source_id] = el.id
        check = @posts.find_by_url(art[:url]).to_a.size

        @posts.create(art) if check.zero?
        # binding.pry
        # @posts.create(art)
      end
    end
    # binding.pry
  end
end
