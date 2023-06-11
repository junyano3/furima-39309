class PurchaseRecordDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_town, :street_number, :building_name,:phone_number, :user_id, :item_id
 
  with_options presence: true do
    # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}    
  validates :city_town
  validates :street_number
  validates :phone_number
  validates :user_id
  validates :item_id
  
end
validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}


def save
  purchase_record =  PurchaseRecord.create( user_id: user_id, item_id: item_id)

  DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city_town: city_town, street_number: street_number, phone_number: phone_number, building_name: building_name, purchase_record_id: purchase_record.id)
end
end
