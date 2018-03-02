Rails.application.routes.draw do
  
	namespace :v1 do
	  get "/recipes" => "recipes#index"
	  get "/recipes/:id" => "recipes#show"
	  post "/recipes" => "recipes#create"
	  patch "/recipes/:id" => "recipes#update"
	  delete "/recipes/:id" => "recipes#destroy"
	end

  namespace :v2 do 
	  resources :recipes
	end

  post "/users" => "users#create"
  post '/user_token' => 'user_token#create'
end
