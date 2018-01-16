class RecipesController < ApplicationController

  def single_recipe_method
    recipe = Recipe.first
    render json: {title: recipe.title, chef: recipe.chef, ingredients: recipe.ingredients, instructions: recipe.directions}
  end

end
