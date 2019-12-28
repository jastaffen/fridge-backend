class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:show]
    def index
    end

    def show
        recipe = Recipe.find(params[:id])
        render json: { recipe: RecipeSerializer.new(recipe) }
    end

    def new
    end

    def create
    end

    def delete
    end
end