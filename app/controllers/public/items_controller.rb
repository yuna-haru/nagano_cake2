class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
    @item.count
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end
