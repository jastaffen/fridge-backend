class RecipeSerializer < ActiveModel::Serializer
    attributes :id, :api_id, :title, :image
end