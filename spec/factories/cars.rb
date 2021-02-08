FactoryBot.define do
  factory :car do
    name {"imprezza"}
    vehicle_number {"GT7000001"}
    transport_bureau {"伊勢志摩"}
    class_number { rand(300..500) }
    registration_type { "む"}
    registration_number { "1893" }
    vehicle_inspection_day { "20210427" }
    registered_year { "20050427" }
    association :customer
  end
end
