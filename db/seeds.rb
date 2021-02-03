Team.create(name:"サンプル第1支店")

User.create(name:"ゲストユーザー1", email:"guest1@example.com", password:SecureRandom.hex(10), team_id:1)
User.create(name:"ゲストユーザー2", email:"guest2@example.com", password:SecureRandom.hex(10), team_id:1)
User.create(name:"開発者アカウント", email:"fujimura@kazuya.com", password:"fuj1mura", team_id:1)




200.times do |i|
  gimei = Gimei.name
  customer_name = "サンプル" + gimei.first.kanji
  kana_customer_name = "サンプル" + gimei.first.katakana
  municipality = Gimei.address.kanji
  cell_phone_number = "0900000#{rand(1000..9999)}"
  phone_number = "030000#{rand(1000..9999)}"
  hobbies = %w(スノーボード ゴルフ 釣り サッカー フットサル 映画鑑賞 カメラ サーフィン ツーリング ガーデニング お菓子作り カフェ巡り)

  Customer.create(name: customer_name, kana_name: kana_customer_name, email: "sample1@sample.com", phone_number:phone_number, cell_phone_number:cell_phone_number, postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", hobby: hobbies[rand(0..(hobbies.count - 1))], memo:"これはサンプルです。", user_id:1, team_id:1)
end

200.times do |i|
  gimei = Gimei.name
  customer_name = "サンプル" + gimei.first.kanji
  kana_customer_name = "サンプル" + gimei.first.katakana
  municipality = Gimei.address.kanji
  cell_phone_number = "0900000#{rand(1000..9999)}"
  phone_number = "030000#{rand(1000..9999)}"
  hobbies = %w(スノーボード ゴルフ 釣り サッカー フットサル 映画鑑賞 カメラ サーフィン ツーリング ガーデニング お菓子作り カフェ巡り)

  Customer.create(name: customer_name, kana_name: kana_customer_name, email: "sample2@sample.com", phone_number:phone_number, cell_phone_number:cell_phone_number, postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", hobby: hobbies[rand(0..(hobbies.count - 1))], memo:"これはサンプルです。", user_id:2, team_id:1)
end
