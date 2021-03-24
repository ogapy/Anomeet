class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.reference :meeting_room_id, foreign_key: true
      t.reference :user_id, foreign_key: true

      t.timestamps
    end
  end
end
