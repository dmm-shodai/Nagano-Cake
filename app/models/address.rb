class Address < ApplicationRecord
	# belongs_to :member
	validates :postal_code, presence: true,length: {is: 7 }
	validates :address, presence: true
	validates :address_name, presence: true
end
