class Item < ApplicationRecord
	attachment :item_image

	belongs_to :genre
	has_many :cart_items
	has_many :order_items
end
