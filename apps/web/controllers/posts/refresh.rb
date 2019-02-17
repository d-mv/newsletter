# frozen_string_literal: true

module Web
  module Controllers
    module Posts
      class Refresh
        include Web::Action

        def call(_params)
          puts '+ Welcome to refresh'
          puts ' start new PostsRefresh class'
          refresh = PostsRefresh.new
          puts ' run -fill-'
          refresh.fill
          puts '- Bye from refresh'
          redirect_to '/'
        end
      end
    end
  end
end
