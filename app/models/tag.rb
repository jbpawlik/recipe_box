class Tag < ApplicationRecord
  has_many :recipe_tags, inverse_of: :expense
  has_many :recipes, :through => :recipe_tags
end