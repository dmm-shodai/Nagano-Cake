class ChangeDateItemImageIdToItem < ActiveRecord::Migration[5.2]
  def up
  	  change_column :genres, :genre_name, :string
  end
  def down
  	  change_column :genres, :genre_name, :integer
  end
end
