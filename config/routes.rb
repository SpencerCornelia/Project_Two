Rails.application.routes.draw do

	resources :rooms
	resources :buttons

  root to: "users#index"

  get "/users", to: "users#index"

end



#      Prefix Verb   URI Pattern                 Controller#Action
#       rooms GET    /rooms(.:format)            rooms#index
#             POST   /rooms(.:format)            rooms#create
#    new_room GET    /rooms/new(.:format)        rooms#new
#   edit_room GET    /rooms/:id/edit(.:format)   rooms#edit
#        room GET    /rooms/:id(.:format)        rooms#show
#             PATCH  /rooms/:id(.:format)        rooms#update
#             PUT    /rooms/:id(.:format)        rooms#update
#             DELETE /rooms/:id(.:format)        rooms#destroy
#     buttons GET    /buttons(.:format)          buttons#index
#             POST   /buttons(.:format)          buttons#create
#  new_button GET    /buttons/new(.:format)      buttons#new
# edit_button GET    /buttons/:id/edit(.:format) buttons#edit
#      button GET    /buttons/:id(.:format)      buttons#show
#             PATCH  /buttons/:id(.:format)      buttons#update
#             PUT    /buttons/:id(.:format)      buttons#update
#             DELETE /buttons/:id(.:format)      buttons#destroy
#        root GET    /                           users#index
#       users GET    /users(.:format)            users#index
