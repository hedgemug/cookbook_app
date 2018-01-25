require 'unirest'

system "clear"

puts "Welcome to the Recipe app! Select an option:"
puts "[1] See all recipes"
puts "[1.5] Search recipes by title"
puts "[2] See one recipe"
puts "[3] Create a recipe"
puts "[4] Update a recipe"
puts "[5] DELETE A RECIPE! (CAREFUL!)"

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/recipes")
  recipes = response.body
  puts JSON.pretty_generate(recipes)
elsif input_option == "1.5"
  puts "Enter search term: "
  search_term = gets.chomp
  puts "Here are the matching recipes: "
  response = Unirest.get("http://localhost:3000/recipes?search=#{search_term}")
  recipes = response.body
  puts JSON.pretty_generate(recipes)
elsif input_option == "2"
  puts "Enter the ID of the recipe to see:"
  input_id = gets.chomp
  response = Unirest.get("http://localhost:3000/recipes/#{input_id}")
  recipe = response.body
  puts JSON.pretty_generate(recipe)
elsif input_option == "3"
  params = {}
  puts "Enter a recipe title: "
  params["title"] = gets.chomp
  puts "Enter a recipe chef: "
  params["chef"] = gets.chomp
  puts "Enter a recipe ingredients: "
  params["ingredients"] = gets.chomp
  puts "Enter a recipe directions: "
  params["directions"] = gets.chomp
  puts "Enter a recipe prep time: "
  params["prep_time"] = gets.chomp
  response = Unirest.post("http://localhost:3000/recipes", parameters: params)
  recipe = response.body
  puts JSON.pretty_generate(recipe)
elsif input_option == "4"
  params = {}
  puts "Enter the ID of the recipe to update:"
  input_id = gets.chomp
  #show user the recipe they want to update
  response = Unirest.get("http://localhost:3000/recipes/#{input_id}")
  recipe = response.body
  # puts JSON.pretty_generate(recipe)
  #prompt the user to update the recipe
  puts "Update the recipe title (#{recipe['title']}): "
  params["title"] = gets.chomp
  puts "Update the recipe chef (#{recipe['chef']}): "
  params["chef"] = gets.chomp
  # delete empty string values in params hash
  params.delete_if { |key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/recipes/#{input_id}", parameters: params)
  updated_recipe = response.body
  puts JSON.pretty_generate(updated_recipe)
elsif input_option == "5"
  puts "Enter the id of the recipe to destroy forever: "
  input_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/recipes/#{input_id}") 
  puts JSON.pretty_generate(response.body)
end
    































    