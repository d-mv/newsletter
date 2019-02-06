module Web
  module Controllers
    module Sources
      class Index
        include Web::Action

        expose :sources

        params do
          required(:source).schema do
            required(:name).filled(:str?)
            required(:url).filled(:str?)
          end
        end

        def call(params)
          @sources = SourceRepository.new.all
        end

      end
    end
  end
end
