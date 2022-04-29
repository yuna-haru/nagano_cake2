class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item.params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @item = Item.all
    @ganre = @item.genre
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end