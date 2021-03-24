class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text :content
      t.boolean :is_disclosed
      t.reference :meeting_room_id, foreign_key: true
      t.reference :user_id, foreign_key: true

      t.timestamps
    end
  end
end
