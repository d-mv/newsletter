module Web
  module Controllers
    module Sources
      class Create
        include Web::Action

        def call(params)
          SourceRepository.new.create(params[:source])

          redirect_to '/sources/list'
        end
      end
    end
  end
end