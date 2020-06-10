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
  # ヘルパーメゾット：exists? true or folseで（）の中の値が左辺のcart_itemsの中にあるか判断する
  # item show.html.erbにてカートに入れるかどうかの判断で使用　0609minowa



  acts_as_paranoid


end
