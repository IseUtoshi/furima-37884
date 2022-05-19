class PurchasesController < ApplicationController
  before_action :find_item, only: [:index, :create]

  def index
    @purchase_delivery_address = PurchaseDeliveryAddress.new
  end

  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase_delivery_address.valid?
      pay_item
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
    params.require(:purchase_delivery_address).permit(:postcode, :building, :house_number, :municipality, :prefecture_id, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
  )
  end

end
