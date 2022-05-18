class PurchasesController < ApplicationController
  before_action :find_item, only: [:index, :create]

  def index
    @purchase_delivery_address = PurchaseDeliveryAddress.new
  end

  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase_delivery_address.valid?
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_delivery_address).permit(:postcode, :building, :house_number, :municipality, :prefecture, :telephone_number).merge(user_id: current_user.id)
  end
end
