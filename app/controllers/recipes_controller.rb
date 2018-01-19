class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes.as_json
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe.as_json
  end

  def create
    #make a new recipe and add to the database
    recipe = Recipe.new(
      title: params[:title], 
      chef: params[:chef], 
      ingredients: params[:ingredients], 
      directions: params[:directions], 
      prep_time: params[:prep_time])
    recipe.save
    render json: recipe.as_json #hash of recipe data
  end

  def update
    # find a recipe by it's ID, and update it
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(
      title: params[:title],
      chef: params[:chef]
    ) 
    render json: recipe.as_json
  end

end





















