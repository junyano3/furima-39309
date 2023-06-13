# require 'rails_helper'

# RSpec.describe DeliveryAddress, type: :model do
#     before do
#       @delivery_address = FactoryBot.build(:delivery_address)
    
#     end

#     describe '配送先住所新規登録' do
#       context '配送先住所が登録できる時' do
#         it 'postal_code , prefecture_id , city_town , street_number , building_name , phone_number, purchase_record_id が存在すれば登録できる' do
#           expect(@delivery_address).to be_valid
#         end
#       end


#   context'配送先住所が登録できない時' do
#     it '購入履歴（purchase_record_id） が紐づいていないと保存できない' do
#       @delivery_address.purchase_record = nil
#       @delivery_address.valid?
#         expect(@delivery_address.errors.full_messages).to include("Purchase record must exist")
      
#      end

#     it '郵便番号が空では保存できない' do
#      @delivery_address.postal_code = ''
#      @delivery_address.valid?
#        expect(@delivery_address.errors.full_messages).to include("Postal code can't be blank")
     
#     end

#     it '郵便番号は、ハイフンがないと保存できないこと' do
#       @delivery_address.postal_code = 1111111
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Postal code is invalid")
#     end
    
#     it '郵便番号は、半角数字でないと保存できないこと' do
#       @delivery_address.postal_code = '１１１-１１１１'
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Postal code is invalid")
#     end

#     it '発送先の都道府県の情報に「---」が選択されている場合は出品できない' do
#       @delivery_address.prefecture_id = 1
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Prefecture can't be blank")
#     end
    
#     it '市区町村が必須であること' do
#       @delivery_address.city_town = ''
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("City town can't be blank")
#     end
    
#     it '番地が必須であること' do
#       @delivery_address.street_number = ''
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Street number can't be blank")

#     end
    
#     it '建物名は空でも登録できること' do
#       @delivery_address.street_number = ''
#       @delivery_address.valid?
      
#     end
    
#     it '電話番号が空では保存できないこと' do
#       @delivery_address.phone_number = ''
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Phone number can't be blank")

#     end
    
#     it '電話番号は、10桁未満の数字は保存できないこと' do
#       @delivery_address.phone_number = 123456789
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Phone number is invalid")

#     end

#     it '電話番号は、11桁より大きい数字は保存できないこと' do
#       @delivery_address.phone_number = 123456789123
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Phone number is invalid")

#     end

#     it '電話番号は、半角数値のみ保存可能であること' do
#       @delivery_address.phone_number = '１１１１１１１１１１'
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Phone number is invalid")

#     end
#   end
# end
# end