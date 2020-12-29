FactoryBot.define do
  gimei = Gimei.name
  sales_name = gimei.kanji.gsub(" ","")
  kana_sales_name = gimei.katakana.gsub(" ","")
  address = Gimei.address

  factory :matter do
    name {"テスト案件"}
    sales_person {sales_name} 
    kana_sales_person {kana_sales_name}
    email {Faker::Internet.free_email}
    phone_number {"0311112222"}
    cell_phone_number {"09011113333"}
    postal_code {"1111111"}
    municipality {address.city.kanji}
    address {"1-1-1"}
    building {"フレーム神南坂4F"}
    association :user
    association :team
  end
end
