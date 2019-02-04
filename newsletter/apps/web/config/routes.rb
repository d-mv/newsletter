# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

get '/', to: 'home#index'


get '/sources', to: 'home#sources'
get '/add', to: 'home#add'
get '/list', to: 'home#list'
