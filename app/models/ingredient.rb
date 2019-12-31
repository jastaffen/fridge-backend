require 'open-uri'
require 'nokogiri'

class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_many :user_ingredients
    has_many :users, through: :user_ingredients
    validates :name, presence: true

    # def self.get_ingredient_image(name)
    #     html = open(`https://www.google.com/search?tbm=isch&q=findSomeImage`)
    #     # doc = open(`https://en.wikipedia.org/wiki/#{name}`)
    #     # html = open(`https://en.wikipedia.org/wiki/#{name}`)
    #     # doc = Nokogiri::HTML(open(`https://en.wikipedia.org/wiki/#{name}`))
    #     byebug
    #     # unparsed_page = HTTParty.get(url)
    #     # parsed_page = Nokogiri::HTML(unparsed_page)
    # end

    # def self.ingredient_images
    #     self.all.each do |ingredient|
    #         formatted_name = ingredient.name.gsub(/\s+/, '_').capitalize
    #         Ingredient.get_ingredient_image(formatted_name)
    #         # byebug
    #     end
    # end
    
    
end
