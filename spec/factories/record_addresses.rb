FactoryBot.define do
  factory :record_address do
    postal_code { '123-4567' }
    shipment_area_id { 2 }
    city { '大阪市' }
    house_number { '123' }
    building_name { '123' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end