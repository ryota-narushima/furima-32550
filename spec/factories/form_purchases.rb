FactoryBot.define do
  factory :form_purchase do
    postal_code             { "123-1234" }
    delivery_source_area_id { 2 }
    city                    { "田中市" }
    address                 { "佐藤" }
    building                { "高橋" }
    phone_num               { "09012345678" }
  end
end
