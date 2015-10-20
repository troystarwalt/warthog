Rails.application.routes.draw do
  get '/', to: 'users#index'
  # get 'users/index'
  get 'users/fact'
  get 'users/profile'

  get '/search', to: 'users#search'
  get '/searchresults', to: 'users#searchresults'

  get '/p', to: 'users#profile'
  get '/profile', to: 'users#profile'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/loginverify', to: 'users#loginverify'

  resources :users

  # using `resources` is the same as defining these attributes manually:

  # get 'users/', 'users#index'
  # post 'users/', 'users#create'
  # get 'users/new', 'users#new'
  # get 'users/:id/edit', 'users#edit'
  # get 'users/:id', 'users#show'
  # patch 'users/:id', 'users#update'
  # post 'users/:id', 'users#update'
  # delete 'users/:id', 'users#destroy'

#          Prefix Verb   URI Pattern               Controller#Action
#    users_fact GET    /users/fact(.:format)     users#fact
# users_profile GET    /users/profile(.:format)  users#profile
#         users GET    /users(.:format)          users#index
#               POST   /users(.:format)          users#create
#      new_user GET    /users/new(.:format)      users#new
#     edit_user GET    /users/:id/edit(.:format) users#edit
#          user GET    /users/:id(.:format)      users#show
#               PATCH  /users/:id(.:format)      users#update
#               PUT    /users/:id(.:format)      users#update
#               DELETE /users/:id(.:format)      users#destroy
end
