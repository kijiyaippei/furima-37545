class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :set_item
    before_action :set_order, only: [:index]
    def index
         @order_address = OrderAddress.new
         order = Order.where("item_id = #{@item.id}")
         
         if order.present?
            redirect_to root_path
         end

    end

    def create
        @order_address = OrderAddress.new(order_params)
        if @order_address.valid?
            Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
            Payjp::Charge.create(
            amount: @item.item_price,   
            card: order_params[:token],    
            currency: 'jpy'        
            )

            @order_address.save
            redirect_to root_path
        else
            render :index
        end
    end

private
def order_params
params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
end

def set_item
    @item = Item.find(params[:item_id])
    end

def set_order
    if @item.user_id == current_user.id
        redirect_to root_path
    end
end