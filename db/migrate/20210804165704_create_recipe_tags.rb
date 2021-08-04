class CreateRecipeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_tags do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :recipe, index: true
      t.timestamps
    end
  end
end
