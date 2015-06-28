class ProductsController < ApplicationController
  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 12)
    @current_order = User.find(current_user.id).orders
                         .where(user_id: current_user.id, complete: false)[0]
                         .order_products.order(quantity: :asc)
    @total_price = 0
      @current_order.each do |item|
        @total_price += (item.quantity * item.product.price)
      end
  end

  def new
  end

  def show
    @products = Product.find(params[:id])
  end

  def create
  end

  def destroy
  end
end
