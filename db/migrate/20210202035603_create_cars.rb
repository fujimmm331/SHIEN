class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name,                    null: false
      t.string :vehicle_number,          null: false
      t.string :transport_bureau,        null: false
      t.integer :class_number,           null: false
      t.string :registration_type,       null: false
      t.string :registration_number,     null: false
      t.integer :vehicle_inspection_day, null: false
      t.integer :registered_year,        null: false
      t.references :customer,            foreign_key: true
      t.timestamps
    end
  end
end


# name                  => 車名
# vehicle_number        => 車体番号
# transport_bureau      => 運輸局（例 横浜、湘南）
# class_number          => 分類番号（例 500 301）
# registration_type     => 登録種別（ひらがなのところ）
# registration_number   => 登録番号（4桁以内の数字）
# vehicle_inspection_day => 車検満了日
# registered_year       => 初度登録
