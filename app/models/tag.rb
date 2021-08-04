class Tag < ApplicationRecord
  has_many :recipe_tags, foreign_key: 'recipe_id'
  has_many :recipes, :through => :recipe_tags
end