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
      @purchase_record_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_record_delivery_address).permit(:postal_code, :prefecture_id, :city_town, :street_number, :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
def item_set
  @item = Item.find(params[:item_id])
end

def user_check
  if current_user.id == @item.user_id
  redirect_to root_path
  end
end

end
