class ChangeDateGenreNameToGenre < ActiveRecord::Migration[5.2]
  def up
  	  change_column :items, :item_image_id, :string
  end
  def down
  	  change_column :items, :item_image_id, :integer
  end
end
