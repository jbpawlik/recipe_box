require 'rails_helper'

describe Recipe do
  # it { should_have_many(:tags).through(:recipe_tags) }
  it { should have_many(:ingredients).through(:ingredient_recipes) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :instructions}
  it { should validate_presence_of :rating }
end