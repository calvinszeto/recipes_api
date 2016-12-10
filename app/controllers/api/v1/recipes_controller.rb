class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def create
    @recipe = Recipe.new
    if @recipe.save
      render json: @recipe
    else
      render status: 403
    end
  end

  def show
    @recipe = Recipe.first
    render json: @recipe
  end

  def update
  end

  def destroy
  end
end
