class Ingredient < ApplicationRecord
  has_many :ingredient_recipes, foreign_key: 'recipe_id'
  has_many :recipes, :through => :ingredient_recipes
  validates :name, presence: true
end