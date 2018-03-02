class V1::RecipesController < ApplicationController

  def index
    recipes = Recipe.all.order(id: :asc)

    search_term = params[:search]
    
    if search_term
      recipes = Recipe.all.order(id: :asc).where("title LIKE ?", "%#{search_term}%")
    end

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
      ingredients: params[:ingredients], 
      directions: params[:directions], 
      prep_time: params[:prep_time],
      image: params[:image],
      user_id: current_user.id
    )
    if recipe.save
      render json: recipe.as_json #hash of recipe data
    else
      render json: {errors: recipe.errors.full_messages}, status: 422
    end
  end

  def update
    # find a recipe by it's ID, and update it
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(
      title: params[:title] || recipe.title,
      ingredients: params[:ingredients] || recipe.ingredients, 
      directions: params[:directions] || recipe.directions, 
      prep_time: params[:prep_time] || recipe.prep_time, 
      image: params[:image] || recipe.image,
    )  
    render json: recipe.as_json
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    render json: {message: "Recipe successfully destroyed!"}
  end

end





















