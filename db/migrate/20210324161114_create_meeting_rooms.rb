class CreateMeetingRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_rooms do |t|
      t.string  :name
      t.integer :leader_id
      t.string  :meeting_id

      t.timestamps
    end
  end
end
