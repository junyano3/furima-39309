# require 'rails_helper'

# RSpec.describe PurchaseRecord, type: :model do
#   before do
#     @purchase_record = FactoryBot.build(:purchase_record)

#   end

#   describe '購入履歴' do
#     context '購入履歴が登録できる時' do
#       it ' user , item, が存在すれば登録できる' do
#         expect(@purchase_record).to be_valid
#       end
#     end
#     context '購入履歴が登録できない時' do
#       it 'user_id がないと登録できない' do
#         @purchase_record.user = nil
#         @purchase_record.valid?
#         expect(@purchase_record.errors.full_messages).to include('User must exist')
#       end
#       it 'item_id がないと登録できない' do
#         @purchase_record.item = nil
#         @purchase_record.valid?
#         expect(@purchase_record.errors.full_messages).to include('Item must exist')
#       end
#   end
# end
# end
