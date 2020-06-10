class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items

  acts_as_paranoid

  def exist_items?(item)
  	cart_items.exists?(item_id: item.id)
  end
  # ヘルパーメソッド：exists? true or falseで（）の中の値が左辺のcart_itemsの中にあるか判断する
end
