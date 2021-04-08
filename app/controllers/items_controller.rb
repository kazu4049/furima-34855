class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end


  def create
  end

  def show
  end

  def edit
  end



  def update
  end

  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:items_name, :content, :price, :image, :category_id, :condition_id, :shipment_area_id,
                                 :shipping_date_id, :postage_id, ).merge(user_id: current_user.id)
  end



end
