class Recipe < ApplicationRecord
  has_many :recipe_tags, foreign_key: 'tag_id'
  has_many :tags, :through => :recipe_tags
  has_many :ingredient_recipes, foreign_key: 'ingredient_id'
  has_many :ingredients
  has_many :ingredients, :through => :ingredient_recipes
  validates :name, presence: true
  validates :instructions, presence: true
  validates :rating, presence: true

  before_save(:titleize_survey)

  private
    def titleize_survey
      self.name = self.name.titleize
    end
end