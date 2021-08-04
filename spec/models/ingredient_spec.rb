require 'rails_helper'

describe Ingredient do
  it { should_have_many(:recipes).through(:ingredient_recipes) }
end