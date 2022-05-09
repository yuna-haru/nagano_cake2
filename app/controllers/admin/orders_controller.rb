class Admin::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    #@order.cart_items = current_customer.cart_items
  end

  def update
   order = Order.find(params[:id])
   order.update(order_params)
   redirect_to admin_orders_show_path
  end

end
