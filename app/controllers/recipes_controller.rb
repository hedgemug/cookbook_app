class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes.as_json
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe.as_json
  end

end
