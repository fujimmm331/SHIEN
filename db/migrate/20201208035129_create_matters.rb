class CreateMatters < ActiveRecord::Migration[6.0]
  def change
    create_table :matters do |t|
      t.string :name,                null: false
      t.string :kana_name,           null: false
      t.string :email
      t.string :phone_number,        null: false
      t.string :cell_phone_number,   null: false
      t.string :postal_code,         null: false
      t.string :municipality,        null: false
      t.string :address,             null: false
      t.string :building
      t.string :hobby
      t.text   :memo
      t.references :user,            foreign_key: true
      t.references :team,            foreign_key: true
      t.timestamps
    end
  end
end

