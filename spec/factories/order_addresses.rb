FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    city {"東京"}
    address {"111"}
    building {"テストビル"}
    phone_number {"00011112222"}
    prefecture_id {2}
  end
end