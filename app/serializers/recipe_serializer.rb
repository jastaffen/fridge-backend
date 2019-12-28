class RecipeSerializer < ActiveModel::Serializer
    attributes :id, :api_id, :title, :image, :instructions
    has_many :ingredients
end