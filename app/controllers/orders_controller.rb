class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = PurchaseShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = PurchaseShippingAddress.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone ).merge(user_id: current_user.id,item_id: params[:item_id])
  end

end
