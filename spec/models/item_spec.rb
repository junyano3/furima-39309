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
    @item.item_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end
  it '商品の説明が必須であること' do
    @item.product_description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Product description can't be blank")
  end
  it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it '商品の状態の情報が必須であること' do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it '配送料の負担の情報が必須であること' do
    @item.shipping_fee_responsibility_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee responsibility can't be blank")
  end
  it '発送元の地域の情報が必須であること' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
  it '発送までの日数の情報が必須であること' do
    @item.shipping_duration_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
  end
  it '価格の情報が必須であること' do
    @item.item_price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item price can't be blank")
  end

  # 価格は、¥300~¥9,999,999の間のみ保存可能であること。
  it '価格は、¥300未満は保存できない' do
    @item.item_price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include('Item price は¥300から¥9,999,999の範囲内で入力してください')
  end

  it '価格は、¥9,999,999より大きい金額は保存できない' do
    @item.item_price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include('Item price は¥300から¥9,999,999の範囲内で入力してください')
  end
 # \\価格は、¥300~¥9,999,999の間のみ保存可能であること。

    it "価格は半角数値のみ保存可能であること" do
      @item.item_price = "12345"  # 半角数字の例
      expect(@item).to be_valid
    
      @item.item_price = "12a34"  # 半角数字以外の文字を含む例
      expect(@item).not_to be_valid
    
      @item.item_price = "１２３４５"  # 全角数字の例
      expect(@item).not_to be_valid
    
      @item.item_price = "12,345"  # カンマ区切りの例
      expect(@item).not_to be_valid
end
end


end

end