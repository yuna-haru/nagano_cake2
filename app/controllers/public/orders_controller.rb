class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end


  def confirm
    @order = Order.new(order_params)
    binding.pry
    if params[:order][:order_address] == "0"
　　　@order = current_customer
    elsif params[:order][:order_address] == "1"
      @order = Order.find(params[:id])
      @order = Order.new
    elsif params[:order][:order_address] == "2"
      @order = Order.new
    end
  end

  def index
  end

  def show
  end


  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
