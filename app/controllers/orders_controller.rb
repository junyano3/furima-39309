class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set, only: [:index, :create]
  before_action :user_check, only: [:index,:create]
  def index
  @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new
  end

  def new
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new
  end

  def create
       @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new(order_params)
      
       if @purchase_record_delivery_address.valid?
        pay_item
      
      @purchase_record_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_record_delivery_address).permit(:postal_code, :prefecture_id, :city_town, :street_number, :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
def item_set
  @item = Item.find(params[:item_id])
end


def user_check
  if current_user.id == @item.user_id || @item.sold?
  redirect_to root_path
  end
end

def pay_item
  Payjp.api_key = "sk_test_744937364eae1c917cf06474"  # 自身のPAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.item_price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end
