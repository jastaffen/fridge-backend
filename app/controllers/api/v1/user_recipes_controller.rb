class Api::V1::UserRecipesController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        user_recipes = UserRecipe.all.select { |user_recipe| user_recipe.user.id === current_user.id }
        render json: user_recipes, each_serializer: UserRecipeSerializer 
    end

end