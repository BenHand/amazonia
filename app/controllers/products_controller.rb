class ProductsController < ApplicationController
  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 12)
    orders = Order.find_by(user_id: current_user.id, complete: false)
    @current_order = orders.products
    @total_price = 0
    @current_order.each do |item|
      @total_price += item.price
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
