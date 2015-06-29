class ProductsController < ApplicationController
  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 12)
    if current_user.orders.where(complete: false).count != 0
      @current_order = User.find(current_user.id).orders
                           .where(user_id: current_user.id, complete: false)[0]
                           .order_products.order(quantity: :asc)
      @total_price = 0
        @current_order.each do |item|
          @total_price += (item.quantity * item.product.price)
        end
      @orders_found = true
    else
      @orders_found = false
    end
  end

  def new
  end

  def show
    @products = Product.find(params[:id])
    if Order.find_by(user_id: current_user.id, complete: false)
      @current_order = User.find(current_user.id).orders
                           .where(user_id: current_user.id, complete: false)[0]
                           .order_products.order(quantity: :asc)
      @total_price = 0
      @current_order.each do |item|
        @total_price += (item.quantity * item.product.price)
      end
    end
  end

  def create
  end

  def destroy
  end
end
