class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, unique: true
      t.references :user
      t.timestamps
    end
  end
end
