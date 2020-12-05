class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, unique: true
      t.references :user ,foreign_key: true
      t.timestamps
    end
  end
end
