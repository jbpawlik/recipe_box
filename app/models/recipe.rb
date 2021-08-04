class Recipe < ApplicationRecord
  has_many :recipe_tags
  validates :name, presence: true
  validates :instructions, presence: true
  validates :rating, presence: true

  before_save(:titleize_survey)

  private
    def titleize_survey
      self.name = self.name.titleize
    end
end