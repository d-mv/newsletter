module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        expose :posts
        expose :sources

        def call(_params)
          @posts = PostRepository.new.sorted_new
          @sources = SourceRepository.new
          # pry-byebug
        end

      end
    end
  end
end
