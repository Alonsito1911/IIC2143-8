class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.text :user1
      t.text :user2
      t.text :mensajes
      t.timestamps
    end
  end
end
