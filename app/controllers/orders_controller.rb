class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def show
    @current_order = User.find(current_user.id).orders
                         .where(user_id: current_user.id, complete: false)[0]
                         .order_products.order(quantity: :asc)
    @total_price = 0
    @current_order.each do |item|
      @total_price += (item.quantity * item.product.price)
    end
  end

  def create
    order = Order.find_or_create_by(user_id: current_user.id, complete: false)
    order_product = OrderProduct.find_or_create_by(order_id: order.id, product_id: params[:product_id])
    order_product.quantity += 1
    order_product.save!
    redirect_to root_url
  end

  def update
    order_item = OrderProduct.find(params[:order_id])
    if order_item.quantity <= 1
      order_item.destroy
      message = { alert: 'Item Removed From Cart!' }
    else
      order_item.quantity -= 1
      order_item.save
      message = { alert: "1 #{order_item.product.title} Removed."}
    end
    redirect_to root_url, message
  end

  def destroy
    # OrderProduct.where(order_id: params[:order_id], product_id: params[:product_id]).destroy
    render json: OrderProduct.destroy(params[:order_id])
  end
end
