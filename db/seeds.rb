Team.create(name:"サンプル第1支店")

User.create(name:"ゲストユーザー", email:"guest@example.com", password:SecureRandom.hex(10), team_id:1)
3.times do |i|
  User.create(name:"サンプルユーザー#{i + 1}", email:"sample#{i + 1}@example.com", password:SecureRandom.hex(10), team_id:1)
end


100.times do |i|
  gimei = Gimei.name
  sales_name = gimei.kanji.gsub(" ","")
  kana_sales_name = gimei.katakana.gsub(" ","")
  email = Faker::Internet.free_email
  municipality = Gimei.address.city.kanji
  
  Matter.create(name:"サンプル案件#{i + 1}", sales_person: sales_name, kana_sales_person: kana_sales_name, email: email, phone_number:"0312345678", cell_phone_number:"09087654321", postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", user_id:1, team_id:1)
end

100.times do |i|
  gimei = Gimei.name
  sales_name = gimei.kanji.gsub(" ","")
  kana_sales_name = gimei.katakana.gsub(" ","")
  email = Faker::Internet.free_email
  municipality = Gimei.address.city.kanji
  
  Matter.create(name:"サンプル商事#{i + 1}", sales_person: sales_name, kana_sales_person: kana_sales_name, email: email, phone_number:"0312345678", cell_phone_number:"09087654321", postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", user_id:2, team_id:1)
end

100.times do |i|
  gimei = Gimei.name
  sales_name = gimei.kanji.gsub(" ","")
  kana_sales_name = gimei.katakana.gsub(" ","")
  email = Faker::Internet.free_email
  municipality = Gimei.address.city.kanji
  
  Matter.create(name:"株式会社サンプル#{i + 1}", sales_person: sales_name, kana_sales_person: kana_sales_name, email: email, phone_number:"0312345678", cell_phone_number:"09087654321", postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", user_id:3, team_id:1)
end

100.times do |i|
  gimei = Gimei.name
  sales_name = gimei.kanji.gsub(" ","")
  kana_sales_name = gimei.katakana.gsub(" ","")
  email = Faker::Internet.free_email
  municipality = Gimei.address.city.kanji
  
  Matter.create(name:"有限会社サンプル#{i + 1}", sales_person: sales_name, kana_sales_person: kana_sales_name, email: email, phone_number:"0312345678", cell_phone_number:"09087654321", postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", user_id:4, team_id:1)
end