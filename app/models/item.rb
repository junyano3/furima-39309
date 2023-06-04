class Item < ApplicationRecord
  # has_one  :purchase_record
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :condition
 belongs_to :shipping_fee_responsibility
 belongs_to :prefecture
 belongs_to :shipping_duration

 validates :item_name, :product_description,presence: true
 validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :shipping_fee_responsibility_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :shipping_duration_id, numericality: { other_than: 1 , message: "can't be blank"}

 validates :item_price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は¥300から¥9,999,999の範囲内で入力してください" }, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
 belongs_to :user
 has_one_attached :image
end
