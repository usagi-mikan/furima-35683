class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order =PurchaseShippingAddress.new(item_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :item_orders_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :delivery_charge_id, :price).merge(user_id: current_user.id)
  end

end