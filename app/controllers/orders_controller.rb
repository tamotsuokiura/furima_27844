class OrdersController < ApplicationController
  before_action :set_item

  def index
    if user_signed_in?
      if @item.user.id == current_user.id
        redirect_to root_path
      else
        @order_info = OrderInfo.new
      end
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order_info = OrderInfo.new(order_params)
    if @order_info.valid?
      pay_item
      @order_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params     
    params.require(:order_info).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: "jpy"
    )
  end

end
