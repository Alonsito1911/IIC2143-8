class AddTelefonoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :telefono, :text
  end
end
