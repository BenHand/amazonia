class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    order = Order.find_or_create_by(user_id: params[:id], complete: false)
    order_product = OrderProduct.find_or_create_by(order_id: order.id, product_id: params[:product_id])
    order_product.quantity += 1
    order_product.save
    render json: order_product.inspect
  end

  def destroy
  end
end
