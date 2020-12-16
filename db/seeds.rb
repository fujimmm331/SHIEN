5.times do |i|
  Team.create(name:"サンプル第#{i + 1}支店")
end

10.times do |i|
  Matter.create(name:"案件#{i + 1}", sales_person:"田中太郎", kana_sales_person:"タナカタロウ", phone_number:"0399991111", cell_phone_number:"09099992222", postal_code:"249-0006", municipality:"逗子市逗子市", address:"4-5-14", building:"藤村ビル1F", user_id:1, team_id:1)
end