require 'rails_helper'

describe IngredientRecipe do
  it { should belong_to(:recipe) }
  it { should belong_to(:ingredient) }
end