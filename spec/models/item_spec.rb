require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do

    context '商品新規登録できるとき' do
    it 'item_name ,product_description  ,item_price ,category_id ,condition_id ,shipping_fee_responsibility_id ,prefecture_id ,shipping_duration_idが存在すれば登録できる' do
    expect(@item).to be_valid
    end
  end


    context '商品新規登録できないとき' do
  it '商品画像が必須であること' do
  end
  it '商品名が空では保存できないこと' do
  end
  it '商品の説明が必須であること' do
  end
  it 'カテゴリーの情報が必須であること' do
  end
  it '商品の状態の情報が必須であること' do
  end
  it '配送料の負担の情報が必須であること' do
  end
  it '発送元の地域の情報が必須であること' do
  end
  it '発送までの日数の情報が必須であること' do
  end
  it '価格の情報が必須であること' do
  end
  it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
  end
  it '価格は半角数値のみ保存可能であること' do
  end
end


end

end