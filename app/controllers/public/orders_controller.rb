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
      @sipmemt_address = Address.find(params[:order][:address_id])
      @order.name = @sipmemt_address.name
      @order.address = @sipmemt_address.address
      @order.postal_code = @sipmemt_address.postal_code
    elsif params[:order][:order_address] == "2"
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.save
      redirect_to public_orders_confirm_path
    end
      @cart_item = CartItem.all
      @order.payment = 800
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.order_status = 0
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.price
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

  def index
    @order = Order.all
  end

  def show
  end


  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :payment ,:shipping_cost)
  end

end
