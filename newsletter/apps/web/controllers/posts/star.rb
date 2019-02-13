module Web
  module Controllers
    module Posts
      class Star
        include Web::Action

        def call(params)
          posts = PostRepository.new
          # byebug
          posts.star(params[:id])
          redirect_to '/'
        end
      end
    end
  end
end