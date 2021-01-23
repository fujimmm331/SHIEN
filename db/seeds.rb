Team.create(name:"サンプル第1支店")

User.create(name:"ゲストユーザー1", email:"guest1@example.com", password:SecureRandom.hex(10), team_id:1)
User.create(name:"ゲストユーザー2", email:"guest2@example.com", password:SecureRandom.hex(10), team_id:1)




200.times do |i|
  gimei = Gimei.name
  sales_name = gimei.kanji.gsub(" ","")
  kana_sales_name = gimei.katakana.gsub(" ","")
  email = Faker::Internet.free_email
  municipality = Gimei.address.city.kanji

  cell_phone_number = "0900000#{rand(1000..9999)}"
  phone_number = "030000#{rand(1000..9999)}"

  Matter.create(name:"サンプル案件#{i + 1}", sales_person: sales_name, kana_sales_person: kana_sales_name, email: email, phone_number:phone_number, cell_phone_number:cell_phone_number, postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", user_id:1, team_id:1)
end

200.times do |i|
  gimei = Gimei.name
  sales_name = gimei.kanji.gsub(" ","")
  kana_sales_name = gimei.katakana.gsub(" ","")
  email = Faker::Internet.free_email
  municipality = Gimei.address.city.kanji
  cell_phone_number = "0900000#{rand(1000..9999)}"
  phone_number = "030000#{rand(1000..9999)}"
  
  Matter.create(name:"サンプル商事#{i + 1}", sales_person: sales_name, kana_sales_person: kana_sales_name, email: email, phone_number:phone_number, cell_phone_number:cell_phone_number, postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", user_id:2, team_id:1)
end
