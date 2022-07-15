class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index]
def index
@item = Item.all
@items = @item.order("created_at DESC")
#@order = Order.find_by(params[:item_id])
@image = Item.find_by(params[:image])

end

def new
@item = Item.new

end

def create
@item = Item.new(item_params)  
if @item.save
redirect_to root_path
else
render :new
end
end

private
def item_params
params.require(:item).permit(:item_name, :item_info, :category_id, :status_id, :shipping_id, :prefecture_id, :delivery_id, :item_price, :image).merge(user_id: current_user.id)
end
