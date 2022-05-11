class Admin::OrderDetailsController < ApplicationController

    def update
        order_detail = OrderDetail.find(params[:id])
        order_status = params[:order_detail][:order_detail_status].to_i
        order_detail.update(order_detail_params)
        
        # 1.「 注文詳細の製作ステータスが製作中だったら」というif文
        # 2. 注文詳細に紐づく注文データを取得
        # 3. 注文データのステータスを「製作中」に更新
        
        # 1. 注文詳細に紐づく注文データを取得
        # 2. 注文データに紐づく注文詳細すべてを取得
        # 3. 注文詳細ひとつひとつ取り出して、「製作完了」以外が入っていないかを確認(難しい)
        # 4. もしすべて製作完了だったら、注文ステータスを「発送準備中」に更新

        
        redirect_to admin_order_path(order_detail.order.id)
    end

    private

  def order_detail_params
    params.require(:order_detail).permit(:order_detail_status)
  end
end
