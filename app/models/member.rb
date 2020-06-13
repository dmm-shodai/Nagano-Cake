class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :orders

  def exist_items?(item)
  	cart_items.exists?(item_id: item.id)
  end


def full_name
    self.surname + self.name
  end

  acts_as_paranoid

validates :surname, presence: true
validates :name, presence: true
validates :kana_surname, presence: true
validates :kana_name, presence: true
validates :postal_code, presence: true, length: { is: 7 }
validates :address, presence: true
validates :phone, presence: true, length: { minimum: 8 }

end
