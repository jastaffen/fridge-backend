# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
Recipe.destroy_all
UserIngredient.destroy_all
UserRecipe.destroy_all


#Users: username, password, firstname, lastname

jack = User.create(username: "jackattack", password_digest: "1111", first_name: "Jack", last_name: "Staffen")
sam = User.create(username: "samglick", password_digest: "2222", first_name: "Sam", last_name: "Glick")

#Ingredients: name, amount, unit

curry_paste = Ingredient.create(name: "curry paste", amount: 1.0, unit: "cup")
filet_mignon = Ingredient.create(name: "filet mignon", amount: 24.0, unit: "oz")
butter = Ingredient.create(name: "butter", amount: 16.0, unit: "tablespoons")
flour = Ingredient.create(name: 'flour', amount: 50.0, unit: 'oz')
cinnamon = Ingredient.create(name: 'cinnamon', amount: 1.0, unit: 'cup')
egg = Ingredient.create(name: 'egg', amount: 12.0, unit: 'number')
chicken = Ingredient.create(name: 'chicken', amount: 65.0, unit: 'oz')
apple = Ingredient.create(name: 'apple', amount: 6, unit: 'number')
baking_soda = Ingredient.create(name: 'baking soda', amount: 16.0, unit: 'oz')

#UserIngredients: user_id, ingredient_id

ui1 = UserIngredient.create(user_id: 1, ingredient_id: 1)
u1i2 = UserIngredient.create(user_id: 1, ingredient_id: 2)
u1i3 = UserIngredient.create(user_id: 1, ingredient_id: 3)
u1i7 = UserIngredient.create(user_id: 1, ingredient_id: 7)

u2i3 = UserIngredient.create(user_id: 2, ingredient_id: 3)
u2i4 = UserIngredient.create(user_id: 2, ingredient_id: 4)
u2i5 = UserIngredient.create(user_id: 2, ingredient_id: 5)
u2i6 = UserIngredient.create(user_id: 2, ingredient_id: 6)
u2i8 = UserIngredient.create(user_id: 2, ingredient_id: 8)


#Recipes: api_id, title, image

apple_pie = Recipe.create(api_id: 2451, title: "Apple Pie", image: "https://images-gmi-pmc.edge-generalmills.com/173da066-c6b4-45dd-9b28-0d459cf6f169.jpg", 
instructions: ["Preheat oven to 375 degrees F.", 
"In a medium-mixing bowl cut the shortening and salt into the flour by hand or with a pastry blender hands until it's the texture of cornmeal. Sprinkle 1 tablespoon of ice water over the mixture and mix just until the dough is moistened. Repeat by adding 6 to 8 tablespoons water (one at a time) until all the dough is just moist. Take care not to over mix.", 
"Preheat the oven to 375 degrees F. Divide the dough in half and roll into a ball. Roll 1 ball into a circle to fit a 9 to 10-inch pie plate. To transfer the pastry to the pie plate, wrap it around a rolling pin and ease it into the pie plate. Be careful not to stretch the pastry. Trim it even with the edges of the pie plate. Add the apple filling into the pastry lined pie plate. Make sure they are laying flat. Cut butter into small pieces and put on top of the filling.", 
"Roll the remaining pastry into a 12-inch circle. Place on top of the filling. Trim off 1-inch beyond the edge of the pie plate. Crimp the edges as desired. Cut slits to allow steam to escape when baking. Sprinkle a little sugar and cinnamon over the pie.", 
"Cover the edges with foil to prevent over browning. Bake for 25 minutes. Remove the foil and bake for another 20 to 25 minutes, or until it is golden brown. Serve warm with vanilla ice cream.", 
"In a medium bowl combine the apples, with the brown and white sugar. Add flour, cinnamon and continue mixing until they are well coated."])
butter_chicken = Recipe.create(api_id: 3351, title: "Butter Chicken", image: "https://www.simplyrecipes.com/wp-content/uploads/2019/01/Butter-Chicken-LEAD-5.jpg")

#Recipe Ingredients: recipe_id, ingredient_id

r1i3 = RecipeIngredient.create(recipe_id: 1, ingredient_id: 3)
r1i4 = RecipeIngredient.create(recipe_id: 1, ingredient_id: 4)
r1i5 = RecipeIngredient.create(recipe_id: 1, ingredient_id: 5)
r1i6 = RecipeIngredient.create(recipe_id: 1, ingredient_id: 6)
r1i8 = RecipeIngredient.create(recipe_id: 1, ingredient_id: 8)
r1i9 = RecipeIngredient.create(recipe_id: 1, ingredient_id: 9)

#userrecipes: user_id, recipe_id

u1r1 = UserRecipe.create(user_id: 1, recipe_id: 1)
