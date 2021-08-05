class Recipe < ApplicationRecord
  has_many :ingredient_recipes, inverse_of: :recipe
  has_many :ingredients, :through => :ingredient_recipes
  has_many :recipe_tags, foreign_key: 'tag_id'
  has_many :tags, :through => :recipe_tags
  validates :name, presence: true
  validates :instructions, presence: true
  validates :rating, presence: true

  before_save(:titleize_survey)

  private
    def titleize_survey
      self.name = self.name.titleize
    end
end