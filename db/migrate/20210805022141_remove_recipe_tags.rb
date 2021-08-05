class RemoveRecipeTags < ActiveRecord::Migration[5.2]
  def change
    drop_table :recipe_tags do |t|
      t.belongs_to :tag, index: true, foreign_key: true
      t.belongs_to :recipe, index: true, foreign_key: true
      t.timestamps
    end
  end
end
