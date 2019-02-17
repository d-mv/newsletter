module Web
  module Controllers
    module Sources
      class Posts
        include Web::Action

        expose :source
        expose :posts

        def call(params)
          @source = SourceRepository.new.find(params[:id])
          posts_rep = PostRepository.new
          @posts = posts_rep.find_by_source(params[:id])
          puts 'hi from controller'
          puts @posts
        end

      end
    end
  end
end