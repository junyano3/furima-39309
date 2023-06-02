
class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
def create
  Item.create(item_params)
end

private
def item_params
  params.require(:item).permit(:item_name, :product_description, :item_price, :category_id, :condition_id, :shipping_fee_responsibility_id, :prefecture_id, :shipping_duration_id, ).merge(user_id: current_user.id)
end

end
