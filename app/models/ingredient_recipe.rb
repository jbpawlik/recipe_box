class IngredientRecipe < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

 # scope :recipe_with_ingredients -> (ingredient_id) { joins(ingredient_recipes: :ingredient).where(ingredients: {id: ingredient_id}) }

end