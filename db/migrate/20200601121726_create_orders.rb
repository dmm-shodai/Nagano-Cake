class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :member_id
    	t.integer :postage
    	t.integer :payment
    	t.integer :order_status
    	t.integer :bill
    	t.string :postal_code
    	t.text :address
    	t.string :address_name

    	t.timestamps
    end
  end
end
