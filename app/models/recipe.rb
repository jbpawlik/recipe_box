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

  #scope :recipe_with_ingredients, -> (ingredient_id) { joins(ingredient_recipes: :ingredient).where(ingredients: {id: ingredient_id}) }

#  SELECT  1 AS one FROM "ingredients" INNER JOIN "ingredient_recipes" ON "ingredients"."id" = "ingredient_recipes"."ingredient_id" WHERE "ingredient_recipes"."recipe_id" = $1 LIMIT $2  [["recipe_id", 2], ["LIMIT", 1]]

### Working on order by highest rating   ><(((("O  '<><
scope :highest_rating, -> { order(rating: :desc)}

  before_save(:titleize_survey)

  private
    def titleize_survey
      self.name = self.name.titleize
    end
end