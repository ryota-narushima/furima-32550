FactoryBot.define do
  factory :item do
    association :user
    name                    {"test"}
    description             {"test"}
    category_id             {"2"}
    condition_id            {"2"}
    delivery_charge_id      {"2"}
    delivery_source_area_id {"2"}
    days_to_delivery_id     {"2"}
    price                   {"5000"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
