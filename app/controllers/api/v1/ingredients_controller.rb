class Api::V1::IngredientsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index 
        Ingredient.ingredient_images
        ingredients = Ingredient.all
        render json: { ingredients: ingredients } 
    end

    def create
        ingredient = Ingredient.create(ingredient_params)
        if ingredient.valid?
            render json: { ingredient: IngredientSerializer.new(ingredient) }
        else
            render json: { error: 'failed to create ingredient' }
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end