# frozen_string_literal: true

module Web
  module Controllers
    module Posts
      class Post
        include Web::Action

        expose :post
        expose :source

        def call(params)
          p params[:id].to_i
          posts = PostRepository.new
          sources = SourceRepository.new
          @post = posts.find(params[:id].to_i)
          @source = sources.find(@post.source_id).name
        end
      end
    end
  end
end
