class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,                         null: false, default: ""
      t.text :product_description,                 null: false
      t.integer :item_price ,                      null: false
      t.integer :category_id,                      null: false
      t.integer :condition_id,                     null: false
      t.integer :shipping_fee_responsibility_id,   null: false
      t.integer :prefecture_id,                    null: false
      t.integer :shipping_duration_id,             null: false
      t.references :user,                          null: false, foreign_key: true
      t.timestamps
    end
  end
end
