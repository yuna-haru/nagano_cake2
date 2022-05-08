class Public::AddressesController < ApplicationController

  def create
    @addresse = Address.new(address_params)
    @addresse.customer_id = current_customer.id
    @addresse.save
    redirect_to public_addresses_path
  end

  def index
    @addresse = Address.new
    @addressed = Address.all
  end

  def edit
    @addresse = Address.find(params[:id])
  end

  def update
    @addresse = Address.find(params[:id])
    @addresse.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    @addresse = Address.find(params[:id])
    @addresse.destroy
    redirect_to public_addresses_path
  end



  private

  def address_params
      params.require(:address).permit(:name, :address, :postal_code)
  end

end