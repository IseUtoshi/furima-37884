class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery_address = PurchaseDeliveryAddress.new
  end

  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new
    if @purchase_delivery_address.valid?
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end
end
