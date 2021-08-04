require 'rails_helper'

describe Tag do
  it { should_have_many(:recipes).through(:recipe_tags) }
end