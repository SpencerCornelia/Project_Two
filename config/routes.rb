Rails.application.routes.draw do
  #would prefer having a root route

  root to: "welcome#index"

  get "/", to: "welcome#index"

  get "/users", to: "users#index"

  get "/users/new", to: "users#new"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show", as: "user_show"

  #need a "sign_in" path

end
