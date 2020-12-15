class CreateMatters < ActiveRecord::Migration[6.0]
  def change
    create_table :matters do |t|
      t.string :name,                null: false
      t.string :sales_person,        null: false
      t.string :kana_sales_person,   null: false
      t.integer :phone_number,       null: false
      t.integer :cell_phone_number,  null: false
      t.string :postal_code
      t.string :municipality,        null: false
      t.string :address,             null: false
      t.string :building,            null: false
      t.references :user,            foreign_key: true
      t.references :team,            foreign_key: true
      t.timestamps
    end
  end
end
