FactoryBot.define do
  factory :notification do
    visiter_id { 1 }
    visited_id { 2 }
    checked { false }
    association :customer
    association :contact_log
  end
end
