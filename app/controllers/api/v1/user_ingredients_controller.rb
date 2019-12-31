class Api::V1::UserIngredientsController < ApplicationController 
    skip_before_action :authorized, only: [:index]

    def index
        user_ingredients = UserIngredient.all.select { |user_ingredient| user_ingredient.user_id == current_user.id }
        render :json => user_ingredients, each_serializer: UserIngredientSerializer
    end

    def create
        user_ingredient = UserIngredient.create(user_ingredient_params)
        render json: { user_ingredient: UserIngredientSerializer.new(user_ingredient) }
    end


    private

    def user_ingredient_params
        params.require(:user_ingredient).permit(:user_id, :ingredient_id, :amount, :unit)
    end
end