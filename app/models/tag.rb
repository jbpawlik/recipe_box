class Tag < ApplicationRecord
  has_many :recipe_tags
  has_many :recipes, :through => :recipe_tags

  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}

end