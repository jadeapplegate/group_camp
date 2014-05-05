GroupCamp::Application.routes.draw do
  resources :guests, only: [:new, :create]

  resources :trips

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  root 'home#index'

  get '/signup', to: 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin', to: 'sessions#new'

  # every action below is a method in the corresponding controller. Ony the GET actions will have views (index, show, new, edit)

#      Prefix Verb   URI Pattern               Controller#Action
#      guests POST   /guests(.:format)         guests#create
#   new_guest GET    /guests/new(.:format)     guests#new
#       trips GET    /trips(.:format)          trips#index
#             POST   /trips(.:format)          trips#create
#    new_trip GET    /trips/new(.:format)      trips#new
#   edit_trip GET    /trips/:id/edit(.:format) trips#edit
#        trip GET    /trips/:id(.:format)      trips#show
#             PATCH  /trips/:id(.:format)      trips#update
#             PUT    /trips/:id(.:format)      trips#update
#             DELETE /trips/:id(.:format)      trips#destroy
#       users POST   /users(.:format)          users#create
#    new_user GET    /users/new(.:format)      users#new
#        user GET    /users/:id(.:format)      users#show
#    sessions POST   /sessions(.:format)       sessions#create
# new_session GET    /sessions/new(.:format)   sessions#new
#     session DELETE /sessions/:id(.:format)   sessions#destroy
#        root GET    /                         home#index
#      signup GET    /signup(.:format)         users#new
#     signout DELETE /signout(.:format)        sessions#destroy
#      signin GET    /signin(.:format)         sessions#new

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  #
end
