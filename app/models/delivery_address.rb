class DeliveryAddress < ApplicationRecord
  belongs_to :purchase_record

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city_town, presence: true
  validates :street_number, presence: true

  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end
