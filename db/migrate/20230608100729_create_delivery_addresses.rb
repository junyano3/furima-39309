class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
     t.string :postal_code,                        null: false
      t.integer :prefecture_id,                    null: false
      t.string :city_town,                         null: false,default: ""
      t.string :street_number,                     null: false,default: ""
      t.string :building_name,                     default: ""
      t.string :phone_number,                      null: false,default: ""
      t.references :purchase_record,               null: false, foreign_key: true
      t.timestamps
    end

  end
end
