class CangeDateMemberQuit < ActiveRecord::Migration[5.2]
  def up
  	change_column :members, :quit,:boolean, default: true
  end
  def down
  	change_column :members, :quit, :boolean
  end

end
