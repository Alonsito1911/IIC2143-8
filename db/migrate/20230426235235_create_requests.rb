class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.text :adress
      t.text :email
      t.integer :amount

      t.timestamps
    end
  end
end
