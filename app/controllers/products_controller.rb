class ProductsController < ApplicationController
  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 12)
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
