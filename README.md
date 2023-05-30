# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| password           | string | null: false |
|   fast_name        | string | null: false |
|   last_name        | string | null: false |
|   fast_name_kana   | string | null: false |
|   last_name_kana   | string | null: false |
|   date of Birth    | string | null: false |


### Association

- has_many :items
- has_many :comments
-------------------------------------------------------

## items テーブル <!-- 商品情報 -->

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| item_image   | string | null: false |
| item_name    | string | null: false |
| item_price   | string | null: false |

### Association

- has_many :comments
- has_one  :pay.jp-id
- belongs_to :user
-------------------------------------------------------

## delivery_addresses テーブル　<!-- 配送先住所 -->

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| delivery_address    | string     | null: false                    | <!-- 住所 -->
| postal_code         | string     | null: false                    | <!-- 郵便番号 -->
| city_town           | string     | null: false                    |<!-- 市区町村 --><!-- 都道府県はアクティブハッシュで -->
| building_name       | string     |                                | <!-- 番地 -->
| phone_number        | string     | null: false                    |<!-- 電話番号 -->

### Association

- belongs_to :pay.jp-id
-------------------------------------------------------

## Purchase Record テーブル <!-- 購入記録 -->

| Column       | Type       | Options                        |
| ------------ | ------     | -----------                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address

