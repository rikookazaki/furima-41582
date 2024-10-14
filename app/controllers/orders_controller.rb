class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :check_sold_out, only: [:index]
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_cord, :prefecture_id, :city, :address_num, :building, :phone_num).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    return unless current_user.id == @item.user_id

    redirect_to root_path
  end

  def check_sold_out
    @item = Item.find(params[:item_id])
    return unless @item.order.present?

    redirect_to root_path
  end
end
