class AddProductsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :products, :text, default: "[]"
  end
end
