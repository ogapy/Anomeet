class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :meeting_room, null: false, foreign_key: true
      t.references :user,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
