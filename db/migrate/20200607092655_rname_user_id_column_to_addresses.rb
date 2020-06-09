class RnameUserIdColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
  	rename_column :addresses, :member_id, :member_id
  	rename_column :cart_items, :member_id, :member_id
  	rename_column :orders, :member_id, :member_id
  end
end
