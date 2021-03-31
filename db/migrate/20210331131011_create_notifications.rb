class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.references :chat, null: false, foreign_key: true
      t.integer :action, null: false
      t.boolean :is_checked, null: false, default: false

      t.timestamps
    end
    add_index :notifications, :sender_id
    add_index :notifications, :receiver_id
  end
end
