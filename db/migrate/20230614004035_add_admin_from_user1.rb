class AddAdminFromUser1 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_id, :bool
  end
end
