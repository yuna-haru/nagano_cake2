class Admin::OrderDetailsController < ApplicationController

    def update
        order_details = order_details.find(params[:id])
        order_details.update
        redirect_to admin_orders_show
    end
end
