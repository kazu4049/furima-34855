class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :postage
  belongs_to :shipment_area
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :items_name
    validates :
    validates :
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :shipping_cost_id
    validates :items_status_id
    validates :days_to_ship_id
    validates :category_id
    validates :prefecture_id
  end

  validates :price, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end




















end
