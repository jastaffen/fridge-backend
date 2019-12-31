require 'open-uri'
require 'nokogiri'

class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_many :user_ingredients
    has_many :users, through: :user_ingredients
    validates :name, presence: true

    def self.get_ingredient_image(name)
        doc = Nokogiri::HTML(open("https://www.google.com/search?tbm=isch&q=#{name}+getty+image"))
        return doc.css('a > img')[1].attr('src')
    end

    def self.ingredient_images
        self.all.each do |ingredient|
            formatted_name = ingredient.name.gsub(/\s+/, '_').capitalize
            if ingredient.image.empty?
                ingredient.update(image: Ingredient.get_ingredient_image(formatted_name))
            end
        end
    end
    
    
end
