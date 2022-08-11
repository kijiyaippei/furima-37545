class ItemsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_item, only: [:show, :edit, :update]

 def index
    @items = Item.all.order("created_at DESC")
    @orders = Order.all  
    @item = Item.find_by(params[:image])
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

def show
    @orders = Order.all   
    @order = Order.where("item_id = #{@item.id}")
    #if @item.user_id == current_user.id && @order.present?
     #   redirect_to root_path
     #end
end
    

def edit
      if @item.user_id == current_user.id && @order.present?
        redirect_to root_path
      end
      if @item.user_id != current_user.id
        redirect_to root_path
      end


end

def update
    @item.update(item_params)
    if  @item.valid?
        redirect_to user_item_path(@item.user_id)
    else 
        render :edit
   end
end

def destroy
    item = Item.find(params[:id])
     item.destroy
     redirect_to action: :index
end

private
def item_params
params.require(:item).permit(:item_name, :item_info, :category_id, :status_id, :shipping_id, :prefecture_id, :delivery_id, :item_price, :image).merge(user_id: current_user.id)
end

def set_item
@item = Item.find(params[:id])
end

def user_item
    if current_user.id != @item.user_id 
        redirect_to root_path
        end
end
end

