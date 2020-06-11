class Address < ApplicationRecord
	belongs_to :member


	validates :postal_code, presence: true,length: {is: 7 }
	validates :address, presence: true
	validates :address_name, presence: true


	def full_address
		self.postal_code + self.address + self.address_name
	end
end
