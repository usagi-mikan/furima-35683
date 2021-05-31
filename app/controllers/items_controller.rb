class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :catch_copy, :concept_category, :concept_status, :delivery_charge, :delivery_area, :delivery_day).merge(user_id: current_user.id)
  end
  
end
