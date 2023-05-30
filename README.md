# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
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
- has_many :purchase_records

-------------------------------------------------------

## items テーブル <!-- 商品情報 -->

| Column                          | Type      | Options                        |
| ------------------------------- | --------- | ------------------------------ |
| item_name                       | string    | null: false                    |
| product_description             | text      | null: false                    | <!--商品説明 -->
| item_price                      | integer   | null: false                    | <!-- アクティブハッシュには_idをつける -->
| category_id                     | integer   | null: false                    |  <!-- カテゴリ -->
| condition_id                    | integer   | null: false                    |  <!-- 商品の状態 -->
| shipping_fee_responsibility_id  | integer   | null: false                    |  <!-- 配送料負担 -->
| prefecture_id                   | integer   | null: false                    |  <!-- 発送元 -->
| shipping_duration_id            | integer   | null: false                    |  <!-- 発送までの日数 -->
| user                            | references| null: false, foreign_key: true | <!-- 出品者のユーザーid -->
 

### Association

- has_many :comments
- has_one  :purchase_record
- belongs_to :user

-------------------------------------------------------

## delivery_addresses テーブル　<!-- 配送先住所 -->

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    | <!-- 郵便番号 -->
| prefecture_id       | integer    | null: false                    | <!-- 都道府県はアクティブハッシュで -->
| city_town           | string     | null: false                    |<!-- 市区町村 -->
| street_number       | string     | null: false                    | <!-- 番地 -->
| building_name       | string     |                                |<!-- 建物名（任意） -->
| phone_number        | string     | null: false                    |<!-- 電話番号 -->
| purchase_record     | references | null: false, foreign_key: true |<!-- 購入者、購入したもののid -->

### Association

- belongs_to :purchase_record
- belongs_to :item
-------------------------------------------------------

## purchase_records テーブル <!-- 購入記録 -->

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address

