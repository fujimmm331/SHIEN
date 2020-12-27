FactoryBot.define do
  factory :contact_log do
    status {"要対応"}
    comment {"テスト"}
    association :user
    association :team
    association :matter
  end
end
