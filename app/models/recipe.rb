class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  has_many :ingredients, :through => :ingredient_recipes
  has_many :recipe_tags
  has_many :tags, :through => :recipe_tags
  validates :name, presence: true
  validates :instructions, presence: true
  validates :rating, presence: true

  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}

  scope :available, -> { where(available: true) }

###  ><(((("O  '<><
  scope :highest_rating, -> { order(rating: :desc)}

  before_save(:titleize_survey)

  private
    def titleize_survey
      self.name = self.name.titleize
    end
end