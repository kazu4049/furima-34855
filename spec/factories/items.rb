FactoryBot.define do
  factory :item do
    items_name                  { 'test' }
    content               { 'test' }
    category_id           { 1 }
    condition_id  { 1 }
    postage_id { 1 }
    shipment_area_id      { 1 }
    shipping_date_id       { 1 }
    price                 { 1111 }
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end