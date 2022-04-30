class Admin::HomesController < ApplicationController
  def top
    @order = Oder.find(params[:id])
    @customer = Customer.find(params[:id])
  end
end
