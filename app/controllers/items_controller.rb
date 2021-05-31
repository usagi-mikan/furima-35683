class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_index_path(@item)
    else
      render :new
  end
end

  private
  def item_params
    params.require(:item).permit(:image, :title, :catch_copy, :concept_category_id, :concept_status_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  
end
