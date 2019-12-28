class CreateUserIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :user_ingredients do |t|
      t.belongs_to :user
      t.belongs_to :ingredient

      t.timestamps
    end
  end
end
