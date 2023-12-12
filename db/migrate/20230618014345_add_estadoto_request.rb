class AddEstadotoRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :estad0, :string 
  end
end
