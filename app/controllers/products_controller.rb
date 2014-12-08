class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :description, :price))
    @product.save
    redirect_to products_path, :flash => { notice: "Product was created successfully" }
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:name, :description, :price))
      redirect_to products_path, :flash => { notice: "Product was updated successfully" }
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, :flash => { alert: "Are you sure?" }
  end
end
