class OrdersController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:index, :create]
  
  
  def index 
    @order_address = OrderAddress.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])

  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
  params.require(:order_address)
        .permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number )
        .merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def contributor_confirmation
    redirect_to root_path if @item.user == current_user || @item.order.present?
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price, 
      card: order_params[:token],                       
      currency: 'jpy'                   
    )
  end
end