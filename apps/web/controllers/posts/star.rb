module Web
  module Controllers
    module Posts
      class Star
        include Web::Action

        def call(params)
          posts = PostRepository.new
          posts.star(params[:id])
          redirect_to request.get_header("HTTP_REFERER") || '/'
        end
      end
    end
  end
end