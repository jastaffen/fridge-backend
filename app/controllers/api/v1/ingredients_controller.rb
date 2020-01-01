class Api::V1::IngredientsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index 
        ingredients = Ingredient.all
        Ingredient.ingredient_images
        render json: { ingredients: ingredients } 
    end

    def create
        ingredient = Ingredient.create(ingredient_params)
        if ingredient.valid?
            ingredient.ingredient_image
            render json: { ingredient: IngredientSerializer.new(ingredient) }
        else
            render json: { error: 'something went wrong. check to make sure that that ingredient does not already exist' }
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end