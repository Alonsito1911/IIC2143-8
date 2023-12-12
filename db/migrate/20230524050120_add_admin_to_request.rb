class AddAdminToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :admin_id, :text, default: "[]"
  end
end
