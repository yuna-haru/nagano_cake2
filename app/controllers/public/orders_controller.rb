class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end


  def confirm
    @order = Order.new(order_params)
    if params[:order][:order_address] == "0"
　　  @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:order_address] == "1"
      @order = Order.find(params[:id])
    elsif params[:order][:order_address] == "2"
      @order = Order.new
    end
#binding.pry

    #@order.postal_code = current_customer.postal_code
    #@order.address = current_customer.address
    #@order.name = current_customer.first_name + current_customer.last_name
  　#@oder.payment_method = current_customer.payment_method
    #@cart_item= current_customer.cart_items
  end

  def index
  end

  def show
  end


  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
