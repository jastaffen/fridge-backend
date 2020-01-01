require 'open-uri'
require 'nokogiri'

class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_many :user_ingredients
    has_many :users, through: :user_ingredients
    validates :name, presence: true
    validates :name, :uniqueness => true
  
    def self.get_ingredient_image(name)
        doc = Nokogiri::HTML(open("https://www.google.com/search?tbm=isch&q=#{name}+getty+image"))
        return doc.css('a > img')[0].attr('src')
    end

    def self.ingredient_images
        self.all.each do |ingredient|
            if ingredient.image.nil?
                formatted_name = ingredient.name.gsub(/\s+/, '_').capitalize
                ingredient.update(image: Ingredient.get_ingredient_image(formatted_name))
            end
        end
    end

    def ingredient_image
        if self.image.nil?
            formatted_name = self.name.gsub(/\s+/, '_').capitalize
            self.update(image: Ingredient.get_ingredient_image(formatted_name))
        end
    end
    
    
end
