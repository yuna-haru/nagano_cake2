class Public::AddressesController < ApplicationController

  def create
    @addresse = Address.new(address_params)
    @addresse.save
    redirect_to public_addresses_path
  end

  def index
    @addresse = Address.new
    @addressed = Address.all
  end

  def edit
  end



  private

  def address_params
      params.require(:address).permit(:name, :address, :postal_code)
  end

end