class Address < ApplicationRecord
	belongs_to :member,optional: true
	# optional: trueはあとで抜く

	validates :postal_code, presence: true,length: {is: 7 }
	validates :address, presence: true
	validates :address_name, presence: true
end
