class AddQuantityToIngredientRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column(:ingredient_recipes, :quantity, :string)
  end
end
