require 'rails_helper'

RSpec.describe PurchaseRecordDeliveryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @purchase_record_delivery_address = FactoryBot.build(:purchase_record_delivery_address, user_id: user.id ,item_id: item.id)
  end
   
  describe '購入機能' do
      context '内容に問題ない場合登録できること' do
        it 'postal_code , prefecture_id , city_town , street_number , building_name , phone_number, user_id , item_id が存在すれば登録できる' do
          expect(@purchase_record_delivery_address).to be_valid
    end
       it '建物名は空でも登録できること' do
          @purchase_record_delivery_address.building_name = ''
          @purchase_record_delivery_address.valid?
        end
  end

      context '配送先住所が登録できない時' do
        it '郵便番号が空では保存できない' do
          @purchase_record_delivery_address.postal_code = ''
          binding.pry
          @purchase_record_delivery_address.valid?
          expect(@purchase_record_delivery_address.errors.full_messages).to include("Postal code can't be blank")
        end
        
      #   it '郵便番号は、ハイフンがないと保存できないこと' do
      #     @purchase_record_delivery_address.postal_code = 1111111
      #     @purchase_record_delivery_address.valid?
      #     expect(@purchase_record_delivery_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      #   end
        
  #       it '郵便番号は、半角数字でないと保存できないこと' do
  #         @purchase_record_delivery_address.postal_code = '１１１-１１１１'
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  #       end
        
  #       it '発送先の都道府県の情報に「---」が選択されている場合は出品できない' do
  #         @purchase_record_delivery_address.prefecture_id = 1
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
  #       end
        
  #       it '市区町村が必須であること' do
  #         @purchase_record_delivery_address.city_town = ''
   
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("City town can't be blank")
  #       end
        
  #       it '番地が必須であること' do
  #         @purchase_record_delivery_address.street_number = ''
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("Street number can't be blank")
  #       end
        
     
        
  #       it '電話番号が空では保存できないこと' do
  #         @purchase_record_delivery_address.phone_number = ''
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("Phone number can't be blank")
  #       end
        
  #       it '電話番号は、10桁未満の数字は保存できないこと' do
  #         @purchase_record_delivery_address.phone_number = 123456789
     
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("Phone number is invalid")
  #       end
        
  #       it '電話番号は、11桁より大きい数字は保存できないこと' do
  #         @purchase_record_delivery_address.phone_number = 123456789123
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("Phone number is invalid")
  #       end
        
  #       it '電話番号は、半角数値のみ保存可能であること' do
  #         @purchase_record_delivery_address.phone_number = '１１１１１１１１１１'
  #         @purchase_record_delivery_address.valid?
  #         expect(@purchase_record_delivery_address.errors.full_messages).to include("Phone number is invalid")
  #       end
  end
end
end
