module Web
  module Controllers
    module Sources
      class Index
        include Web::Action

        expose :sources

        def call(params)
          @sources = SourceRepository.new.all
        end

      end
    end
  end
end
