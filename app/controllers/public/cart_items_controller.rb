class Public::CartItemsController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @cart_item = Item.find(params[:id])
  end
end
