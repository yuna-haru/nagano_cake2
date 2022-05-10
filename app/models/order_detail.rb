class OrderDetail < ApplicationRecord
   belongs_to :item
   belongs_to :order
   enum order_detail_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }
   #rbなら日本語でもいいけど、基本は英字で記述しなくてはいけない。
end
