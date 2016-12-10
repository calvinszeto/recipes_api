class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: @recipe
    else
      render status: 403
    end
  end

  def show
    render json: @recipe
  end

  def update
    if @recipe.update_attributes(recipe_params)
      render json: @recipe
    else
      render status: 403
    end
  end

  def destroy
    if @recipe.destroy
      render status: 200
    else
      render status: 403
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
