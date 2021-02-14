Team.create(name:"サンプル第1支店")

User.create(name:"ゲストユーザー1", email:"guest1@example.com", password:SecureRandom.hex(10), team_id:1)
User.create(name:"ゲストユーザー2", email:"guest2@example.com", password:SecureRandom.hex(10), team_id:1)
User.create(name:"開発者アカウント", email:"fujimura@kazuya.com", password:"fuj1mura", team_id:1)


200.times do |i|
  # customerデータのサンプル
  gimei = Gimei.name
  customer_name = "サンプル" + gimei.first.kanji
  kana_customer_name = "サンプル" + gimei.first.katakana
  municipality = Gimei.address.kanji
  cell_phone_number = "0900000#{rand(1000..9999)}"
  phone_number = "030000#{rand(1000..9999)}"
  hobbies = %w(スノーボード ゴルフ 釣り サッカー フットサル 映画鑑賞 カメラ サーフィン ツーリング ガーデニング お菓子作り カフェ巡り)
  # /customerデータのサンプル


  # carデータのサンプル
  car_names = %w(インプレッサ レヴォーグ フォレスター アウトバック WRX XV シフォン サンバー)
  alphabets = ("a".."z").to_a
  vehicle_number = "#{alphabets[rand(0..alphabets.count - 1)] + alphabets[rand(0..alphabets.count - 1)]}#{rand(100000..999999)}"
  registered_year = "#{rand(1996..2020)}04#{rand(1..30)}"
  vehicle_inspection_day = "#{rand(2021..2024)}04#{rand(1..30)}"
  # /carデータのサンプル

  # レコード作成する記述
  customer = Customer.new(name: customer_name, kana_name: kana_customer_name, email: "sample1@sample.com", phone_number:phone_number, cell_phone_number:cell_phone_number, postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", hobby: hobbies[rand(0..(hobbies.count - 1))], memo:"これはサンプルです。", user_id:1, team_id:1)
  car = customer.car.build(name:car_names[rand(0..(car_names.count - 1))], vehicle_number:vehicle_number, transport_bureau:"湘南", class_number:"531", registration_type:"あ", registration_number:"#{rand(1..9999)}", registered_year:registered_year, vehicle_inspection_day:vehicle_inspection_day)
  customer.save
  # /レコード作成する記述
end

200.times do |i|
  # customerデータのサンプル
  gimei = Gimei.name
  customer_name = "サンプル" + gimei.first.kanji
  kana_customer_name = "サンプル" + gimei.first.katakana
  municipality = Gimei.address.kanji
  cell_phone_number = "0900000#{rand(1000..9999)}"
  phone_number = "030000#{rand(1000..9999)}"
  hobbies = %w(スノーボード ゴルフ 釣り サッカー フットサル 映画鑑賞 カメラ サーフィン ツーリング ガーデニング お菓子作り カフェ巡り)
  # /customerデータのサンプル


  # carデータのサンプル
  car_names = %w(インプレッサ レヴォーグ フォレスター アウトバック WRX XV シフォン サンバー)
  alphabets = ("a".."z").to_a
  vehicle_number = "#{alphabets[rand(0..alphabets.count - 1)] + alphabets[rand(0..alphabets.count - 1)]}#{rand(100000..999999)}"
  registered_year = "#{rand(1996..2020)}04#{rand(1..30)}"
  vehicle_inspection_day = "#{rand(2021..2024)}04#{rand(1..30)}"
  # /carデータのサンプル

  # レコード作成する記述
  customer = Customer.new(name: customer_name, kana_name: kana_customer_name, email: "sample1@sample.com", phone_number:phone_number, cell_phone_number:cell_phone_number, postal_code:"1000001", municipality: municipality, address:"1-1-1", building:"サンプルビル1F", hobby: hobbies[rand(0..(hobbies.count - 1))], memo:"これはサンプルです。", user_id:2, team_id:1)
  car = customer.car.build(name:car_names[rand(0..(car_names.count - 1))], vehicle_number:vehicle_number, transport_bureau:"湘南", class_number:"531", registration_type:"あ", registration_number:"#{rand(1..9999)}", registered_year:registered_year, vehicle_inspection_day:vehicle_inspection_day)
  customer.save
  # /レコード作成する記述
end