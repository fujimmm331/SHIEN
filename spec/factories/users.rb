FactoryBot.define do
  factory :user do
    name {"山田太郎"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6).downcase}
    password_confirmation {password}
    association :team
  end
end
