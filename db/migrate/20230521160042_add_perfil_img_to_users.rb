class AddPerfilImgToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :perfil_img, :string
  end
end
