class CreateItems < ActiveRecord::Migration[5.2]
	def change
		create_table :items do |t|
			t.integer :genre_id
			t.string :item_name
			t.integer :price
			t.boolean :sale_status
			t.string :item_profile
			t.integer :item_image_id

			t.timestamps
		end
	end
end
