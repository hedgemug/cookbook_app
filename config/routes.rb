Rails.application.routes.draw do
  
  get "/recipes" => "recipes#index"
  get "/recipes/:id" => "recipes#show"
  post "/recipes" => "recipes#create"
  patch "/recipes/:id" => "recipes#update"
  delete "/recipes/:id" => "recipes#destroy"

  post "/users" => "users#create"
  post '/user_token' => 'user_token#create'
end
