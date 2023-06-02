class Item < ApplicationRecord
  # has_one  :purchase_record

 belongs_to :user
 has_one_attached :image
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category

 validates :item_name, :product_description, :item_price,presence: true
 validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}


end
