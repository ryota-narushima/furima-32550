FactoryBot.define do
  factory :form_purchase do
    token                   {"tok_abcdefghijk00000000000000000"}
    postal_code             { "123-1234" }
    delivery_source_area_id { 2 }
    city                    { "田中市" }
    address                 { "佐藤" }
    building                { "高橋" }
    phone_num               { "09012345678" }
    user_id                 { 8 }
    item_id                 { 34 }
  end
end
