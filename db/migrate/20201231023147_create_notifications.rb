class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id,     null: false
      t.integer :visited_id,     null: false
      t.references :customer,      foreign_key: true
      t.references :contact_log, foreign_key: true
      t.boolean :checked,        default: false, null: false
      t.timestamps
    end
  end
end
