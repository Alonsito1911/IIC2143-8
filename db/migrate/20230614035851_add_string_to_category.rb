class AddStringToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :tipo, :string,  foreign_key: true 
  end
end
