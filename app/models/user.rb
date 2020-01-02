class User < ApplicationRecord
    has_secure_password
    has_many :user_ingredients
    has_many :ingredients, through: :user_ingredients
    has_many :user_recipes
    has_many :recipes, through: :user_recipes
    validates :first_name, :last_name, :username, :password_digest, presence: true
    validates :username, uniqueness: { case_sensitive: false }
end
