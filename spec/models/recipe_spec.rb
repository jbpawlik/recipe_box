require 'rails_helper'

describe Recipe do
<<<<<<< HEAD
  it { should have_many(:tags).through(:recipe_tags) }
  it { should have_many(:ingredients).through(:ingredient_recipes) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :instructions }
=======
  # it { should_have_many(:tags).through(:recipe_tags) }
  it { should have_many(:ingredients).through(:ingredient_recipes) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :instructions}
>>>>>>> cc55938dbc1044cfe9e50663178c825803b8a733
  it { should validate_presence_of :rating }
end