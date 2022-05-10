class Admin::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @order.order_details = OrderDetail.all
  end

  def update
   order = Order.find(params[:id])
   order.update(order_params)
   redirect_to admin_order_path(order.id)
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
