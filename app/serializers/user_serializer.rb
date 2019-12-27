class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :username
    has_many :ingredients
    has_many :recipes
end