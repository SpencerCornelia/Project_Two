Rails.application.routes.draw do
  #would prefer having a root route

  root to: "welcome#index"

  get "/", to: "welcome#index"

  get "/users", to: "users#index"

  get "/users/new", to: "users#new"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show", as: "user_show"

  get "/sign_in", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sessions", to: "sessions#destroy", as: "user_logout"

end
