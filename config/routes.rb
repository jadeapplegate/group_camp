GroupCamp::Application.routes.draw do
  
  root 'home#index'
  
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin', to: 'sessions#new'

  resources :users, only: [:new, :create]

  get 'trips/search', to: 'trips#search'

  get '/trips/results', to: 'trips#results'

  get '/trips/details', to: 'trips#details'
  
  resources :trips

  resources :guests, only: [:new, :create]

  #will need another path for the shared url. Maybe like /share/random_generated_string

  # every action below is a method in the corresponding controller. Ony the GET actions will have views (index, show, new, edit)
#       Prefix Verb   URI Pattern               Controller#Action
#          root GET    /                         home#index
#      sessions POST   /sessions(.:format)       sessions#create
#   new_session GET    /sessions/new(.:format)   sessions#new
#       session DELETE /sessions/:id(.:format)   sessions#destroy
#        signup GET    /signup(.:format)         users#new
#       signout DELETE /signout(.:format)        sessions#destroy
#        signin GET    /signin(.:format)         sessions#new
#         users POST   /users(.:format)          users#create
#      new_user GET    /users/new(.:format)      users#new
#  trips_search GET    /trips/search(.:format)   trips#search
# trips_results GET    /trips/results(.:format)  trips#results
# trips_details GET    /trips/details(.:format)  trips#details
#         trips GET    /trips(.:format)          trips#index
#               POST   /trips(.:format)          trips#create
#      new_trip GET    /trips/new(.:format)      trips#new
#     edit_trip GET    /trips/:id/edit(.:format) trips#edit
#          trip GET    /trips/:id(.:format)      trips#show
#               PATCH  /trips/:id(.:format)      trips#update
#               PUT    /trips/:id(.:format)      trips#update
#               DELETE /trips/:id(.:format)      trips#destroy
#        guests POST   /guests(.:format)         guests#create
#     new_guest GET    /guests/new(.:format)     guests#new



end
