class Admin::OrderDetailsController < ApplicationController

    def update
        order_detail = OrderDetail.find(params[:id])
        order_status = params[:order_detail][:order_detail_status].to_i
        @order = order_detail.order
        @order_details = @order.order_details #updateの後に変数を記述するとエラーが出る可能性がある
        order_detail.update(order_detail_params)

        @order_details.each do |od|
            if od.order_detail_status_before_type_cast == 2
            @order.update(order_status: 2)
            end
        end

        flag = false
            @order_details.each do |order_d|
                if order_d.order_detail_status_i18n == "製作完了"
                    flag = true
                else
                    flag = false
                    break
                end
            end
            if flag == true
                @order.update(order_status: 3)
            end
            #if@order_details.all?{ |order_d| order_d.order_detail_status_i18n == "製作完了" }
                #@order.update(order_status: 3)
            #end
            

        # 1.「 注文詳細の製作ステータスが製作中だったら」というif文
        # 2. 注文詳細に紐づく注文データを取得 ※6行目
        # 3. 注文データのステータスを「製作中」に更新
        # 一つでもが大事

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
