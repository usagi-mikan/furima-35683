class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    # @donation_address = DonationAddress.new(donation_params)
    # if @donation_address.valid?
    #   @donation_address.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :delivery_charge_id, :price).merge(user_id: current_user.id)
  end

end
