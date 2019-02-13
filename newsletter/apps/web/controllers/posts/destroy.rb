module Web
  module Controllers
    module Posts
      class Destroy
        include Web::Action

        def call(params)
          posts = PostRepository.new
          # byebug
          posts.destroy(params[:id])
          redirect_to '/'
        end
      end
    end
  end
end
