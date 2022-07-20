class OrdersController < ApplicationController

    def index
        @item = Item.find(params[:item_id])
         @order_address = OrderAddress.new
         order = Order.all
         order = Order.where("item_id = #{@item.id}")
         
         if user_signed_in? && @item.user_id == current_user.id && order.present?
            redirect_to root_path
         end
         if user_signed_in? && @item.user_id == current_user.id 
            redirect_to root_path
         end
         unless user_signed_in?
            redirect_to new_user_session_path
         end
    end

    def create
        @item = Item.find(params[:item_id])
        @order_address = OrderAddress.new(order_params)
        if @order_address.valid?
            Payjp.api_key = "sk_test_e1fb93ed445053d5472c8cd3"
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

end
