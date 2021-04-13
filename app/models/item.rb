class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :postage
  belongs_to :shipment_area
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :items_name
    validates :price
    validates :content
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :condition_id
    validates :category_id
    validates :postage_id
    validates :shipment_area_id
    validates :shipping_date_id
  end

  validates :price, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
