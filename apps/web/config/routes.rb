# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

get '/', to: 'home#index'

get '/sources/list', to: 'sources#list'
get '/sources', to: 'sources#index'
get '/sources/new', to: 'sources#new'
post '/sources', to: 'sources#create'
get '/posts', to: 'posts#index'
get '/post/:id', to: 'posts#post'
get '/posts/refresh', to: 'posts#refresh'
get '/posts/sources', to: 'sources#index'
get '/posts/destroy/:id', to: 'posts#destroy'
get '/posts/star/:id', to: 'posts#star'
get '/sources/:id/posts', to: 'sources#posts'
get '/sources/:id/destroy', to: 'sources#destroy'
