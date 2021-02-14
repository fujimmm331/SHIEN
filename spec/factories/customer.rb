FactoryBot.define do
  gimei = Gimei.name
  name = gimei.kanji.gsub(" ","")
  kana_name = gimei.katakana.gsub(" ","")
  address = Gimei.address

  factory :customer do
    name {name}
    kana_name {kana_name}
    email {Faker::Internet.free_email}
    phone_number {"0311112222"}
    cell_phone_number {"09011113333"}
    postal_code {"1111111"}
    municipality {address.kanji}
    address {"1-1-1"}
    building {"フレーム神南坂4F"}
    hobby {"フットサル"}
    memo {"基本的に連絡は携帯にすること。日中は仕事のため出られないとのこと"}
    association :user
    association :team
  end
end
