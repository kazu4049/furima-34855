class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_area_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shipment_area_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, shipment_area_id: shipment_area_id,
                  city: city, house_number: house_number, phone_number: phone_number, record_id: record.id)
  end

end