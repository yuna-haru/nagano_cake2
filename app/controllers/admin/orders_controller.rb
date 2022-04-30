class Admin::OrdersController < ApplicationController
  def show
    @custmer = Customer.find(params[:id])
    @order = Oder.find(params[:id])
    @item = Item.all
  end
  def update
   order = Order.find(params[:id])
   order.update(order_params)
   redirect_to admin_orders_show_path
  end
end
