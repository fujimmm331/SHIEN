class CreateTeamMatters < ActiveRecord::Migration[6.0]
  def change
    create_table :team_matters do |t|
      t.references :team, foreign_key: true
      t.references :matter, foreign_key: true
      t.timestamps
    end
  end
end
