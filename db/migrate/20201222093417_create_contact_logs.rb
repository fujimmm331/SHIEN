class CreateContactLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_logs do |t|
      t.string :status
      t.text :comment,      null: false
      t.references :user,   foreign_key: true
      t.references :team,   foreign_key: true
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
