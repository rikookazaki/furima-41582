class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy, :move_to_index, :check_sold_out]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :check_sold_out, only: [:edit]
  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :how_long_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if current_user.id == @item.user_id

    redirect_to root_path
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def check_sold_out
    return unless @item.order.present?

    redirect_to root_path
  end
end
