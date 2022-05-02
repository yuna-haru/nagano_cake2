class Public::HomesController < ApplicationController
  def top
    @items = Item.last(4)
  end


 private

  def list_params
    params.require(:list).permit(:image)
  end

end