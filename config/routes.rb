GroupCamp::Application.routes.draw do
  
  root 'home#index'
  
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin', to: 'sessions#new'

  resources :users, only: [:create]

  get 'trips/search', to: 'trips#search'
  get '/trips/results', to: 'trips#results'
  get 'trips/new', to: 'trips#new', as: "new_trip"
  post 'trips', to: 'trips#create', as: "trips"
  delete 'trips/:id', to: 'trips#destroy'        
  get 'trips/:share_url', to: 'trips#show', as: "trip"

  resources :guests, only: [:create]

  # every action below is a method in the corresponding controller. Ony the GET actions will have views (index, show, new, edit)
#  Prefix Verb   URI Pattern                 Controller#Action
#          root GET    /                           home#index
#      sessions POST   /sessions(.:format)         sessions#create
#   new_session GET    /sessions/new(.:format)     sessions#new
#       session DELETE /sessions/:id(.:format)     sessions#destroy
#        signup GET    /signup(.:format)           users#new
#       signout DELETE /signout(.:format)          sessions#destroy
#        signin GET    /signin(.:format)           sessions#new
#         users POST   /users(.:format)            users#create
#  trips_search GET    /trips/search(.:format)     trips#search
# trips_results GET    /trips/results(.:format)    trips#results
#      new_trip GET    /trips/new(.:format)        trips#new
#         trips POST   /trips(.:format)            trips#create
#               DELETE /trips/:id(.:format)        trips#destroy
#          trip GET    /trips/:share_url(.:format) trips#show
#        guests POST   /guests(.:format)           guests#create
end
