class Admin::OrderDetailsController < ApplicationController

    def update
        order_detail = OrderDetail.find(params[:id])
        order_status = params[:order_detail][:order_detail_status].to_i
        order_detail.update(order_detail_params)
        redirect_to admin_order_path(order_detail.order.id)
    end

    private

  def order_detail_params
    params.require(:order_detail).permit(:order_detail_status)
  end
end
