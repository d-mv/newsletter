module Web
  module Controllers
    module Sources
      class Destroy
        include Web::Action

        def call(params)
          sources = SourceRepository.new
          sources.destroy(params[:id])
          redirect_to '/sources/list'
        end
      end
    end
  end
end
