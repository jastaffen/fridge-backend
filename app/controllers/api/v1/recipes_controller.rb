class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create, :update]

    def index
        recipes = Recipe.all
        render json: recipes, each_serializer: RecipeSerializer
    end

    def show
        recipe = Recipe.find(params[:id])
        render json: { recipe: RecipeSerializer.new(recipe) }
    end

    def create
        recipe = Recipe.create(recipe_preliminary_params)
        if recipe.valid?
            recipe.user_recipes.create(user: current_user)
            render json: { recipe: RecipeSerializer.new(recipe) }
        else 
            render json: { error: 'something went wrong. we apologize for this inconvenience' }
        end
    end

    def update
        recipe = Recipe.find(recipe_secondary_params[:id])
        recipe.add_recipe_ingredients(recipe_ingredient_params) 
        recipe.update(instructions: recipe_secondary_params[:instructions])
        render json: { recipe: RecipeSerializer.new(recipe) }
    end

    def delete
    end

    private

    def recipe_preliminary_params
        params.require(:recipe).permit(:api_id, :title, :image)
    end

    def recipe_ingredient_params
        params.require(:recipe_ingredients)
    end

    def recipe_secondary_params
        params.require(:recipe).permit(:id, :instructions => [])
    end

end