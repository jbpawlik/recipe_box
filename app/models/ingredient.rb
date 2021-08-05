class Ingredient < ApplicationRecord
  has_many :ingredient_recipes
  has_many :recipes, :through => :ingredient_recipes
  validates :name, presence: true

  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}
  scope :alphabetized, -> { order(name: :desc)}

  scope :available, ->{ where(available: true) }

end
