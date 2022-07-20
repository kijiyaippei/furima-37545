class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    before_action :set_item, only: [:show, :edit, :update]

def index
    @items = Item.all.order("created_at DESC")
    @orders = Order.all  #item_indexにおいて、SOLD OUTの表示の際に、each〜doメソッドの中で使用しています

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
end

def edit
    order = Order.all
    order = Order.where("item_id = #{@item.id}")
    if user_signed_in? && @item.user_id == current_user.id && order.present?
        redirect_to root_path
     end
    
 unless user_signed_in?
    redirect_to new_user_session_path
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
    if if user_signed_in? && current_user.id != @item.user_id 
     item.destroy
    redirect_to action: :index

end

    end
end

private
def item_params
params.require(:item).permit(:item_name, :item_info, :category_id, :status_id, :shipping_id, :prefecture_id, :delivery_id, :item_price, :image).merge(user_id: current_user.id)
end

def set_item
@item = Item.find(params[:id])
end


end

