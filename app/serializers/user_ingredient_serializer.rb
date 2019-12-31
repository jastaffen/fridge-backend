class UserIngredientSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :ingredient_id, :amount, :unit
    belongs_to :ingredient
end