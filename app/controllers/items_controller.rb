class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index]

def index
    @items = Item.all.order("created_at DESC")

    #@orders = Order.all
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
