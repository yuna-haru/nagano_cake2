class Admin::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @order.order_details = OrderDetail.all
  end

  def update
   order = Order.find(params[:id])
   order.update(order_params)
   if params[:order][:order_status] == "入金確認"
    @order = order.order_details
    @order.each do |order_detail|
      order_detail.order_detail_status = "製作待ち"
      order_detail.update(order_detail_status: order_detail.order_detail_status)
    end
   end
   # 1. 「注文statusが、「入金確認」だったら」というif文
   # 2. 注文に紐づく注文詳細すべてを取得
   # 3. 注文詳細ひとつひとつのデータを取り出して(each)、製作ステータスを「製作待ち」に変更する

   redirect_to admin_order_path(order.id)
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
