class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    @items = Item.all
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

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :condition_id, :carriage_id, :area_id, :duration_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
