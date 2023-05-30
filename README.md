# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false , unique: true|
| encrypted_password | string | null: false               |
|   fast_name        | string | null: false               |
|   last_name        | string | null: false               |
|   fast_name_kana   | string | null: false               |
|   last_name_kana   | string | null: false               |
|   date_of_birth    | date   | null: false               |


### Association

- has_many :items
- has_many :comments
- has_many :Purchase Record

-------------------------------------------------------

## items テーブル <!-- 商品情報 -->

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| item_image   | string | null: false |
| item_name    | string | null: false |
| item_price   | string | null: false |

### Association

- has_many :comments
- has_one  :purchase record
- belongs_to :user
-------------------------------------------------------

## delivery_addresses テーブル　<!-- 配送先住所 -->

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    | <!-- 郵便番号 -->
| prefecture          | string     | null: false                    | <!-- 都道府県はアクティブハッシュで -->
| city_town           | string     | null: false                    |<!-- 市区町村 -->
| building_name       | string     |                                | <!-- 番地 -->
| phone_number        | string     | null: false                    |<!-- 電話番号 -->
| pay.jp_id           | references | null: false, foreign_key: true |<!-- 購入者クレジット情報id -->

### Association

- belongs_to :Purchase Record
-------------------------------------------------------

## Purchase Record テーブル <!-- 購入記録 -->

| Column                    | Type       | Options                        |
| ------------              | ------     | -----------                    |
| user_id                   | references | null: false, foreign_key: true |
| item_id                   | references | null: false, foreign_key: true |
| delivery_address_id       | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address

