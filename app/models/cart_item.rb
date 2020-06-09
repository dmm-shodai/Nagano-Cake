class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :member,optional: true
	# ログインしてないので会員IDがなくエラーが発生するので
	# 一旦「oprional: true」にて会員IDのnilを許可してます
end
