class Recipe < ApplicationRecord
    has_many :user_recipes
    has_many :users, through: :user_recipes
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def add_recipe_ingredients(recipe_ingredients)
        recipe_ingredients[0].each { |ingredient, image| self.ingredients.create(name: ingredient.downcase, image: image)}
    end
end
