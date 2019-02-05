# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

get '/', to: 'home#index'


get '/sources/list', to: 'sources#list'
get '/sources', to: 'sources#index'
get '/posts', to: 'posts#index'
get '/sources/new', to: 'sources#new'
post '/sources', to: 'sources#create'
get '/posts/article', to: 'posts#article'
