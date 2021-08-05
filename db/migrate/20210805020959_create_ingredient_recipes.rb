class CreateIngredientRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_recipes do |t|
      t.belongs_to :ingredient, index: true, foreign_key: true
      t.belongs_to :recipe, index: true, foreign_key: true
      t.timestamps
    end
  end
end
