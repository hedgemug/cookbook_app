require 'unirest'

system "clear"

puts "Welcome to the Recipe app! Select an option:"
puts "[1] See all recipes"
puts "[2] See one recipe"
puts "[3] Create a recipe"

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/recipes")
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
end
    











    