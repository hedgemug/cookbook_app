Rails.application.routes.draw do
  get "/single_recipe_url" => "recipes#single_recipe_method"
end
