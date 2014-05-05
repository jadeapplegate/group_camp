GroupCamp::Application.routes.draw do
  
  root 'home#index'
  
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin', to: 'sessions#new'

  resources :users, only: [:new, :create]

  get 'trip/search', to: 'trips#search'

  get '/trip/results', to: 'trips#results'

  get '/trip/details', to: 'trips#details'
  
  resources :trips

  resources :guests, only: [:new, :create]

  # every action below is a method in the corresponding controller. Ony the GET actions will have views (index, show, new, edit)

#         root GET    /                         home#index
#     sessions POST   /sessions(.:format)       sessions#create
#  new_session GET    /sessions/new(.:format)   sessions#new
#      session DELETE /sessions/:id(.:format)   sessions#destroy
#       signup GET    /signup(.:format)         users#new
#      signout DELETE /signout(.:format)        sessions#destroy
#       signin GET    /signin(.:format)         sessions#new
#        users POST   /users(.:format)          users#create
#     new_user GET    /users/new(.:format)      users#new
#  trip_search GET    /trip/search(.:format)    trips#search
# trip_results GET    /trip/results(.:format)   trips#results
# trip_details GET    /trip/details(.:format)   trips#details
#        trips GET    /trips(.:format)          trips#index
#              POST   /trips(.:format)          trips#create
#     new_trip GET    /trips/new(.:format)      trips#new
#    edit_trip GET    /trips/:id/edit(.:format) trips#edit
#         trip GET    /trips/:id(.:format)      trips#show
#              PATCH  /trips/:id(.:format)      trips#update
#              PUT    /trips/:id(.:format)      trips#update
#              DELETE /trips/:id(.:format)      trips#destroy
#       guests POST   /guests(.:format)         guests#create
#    new_guest GET    /guests/new(.:format)     guests#new


end
