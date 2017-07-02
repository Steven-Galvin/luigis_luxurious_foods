class ProductsController < ApplicationController
  def index
    @products = Product.three_most_recent
    if params[:filter] === "all"
      @products = Product.all
    elsif params[:filter] === "usa_made"
      @products = Product.made_in_usa
    elsif params[:filter] === "most_reviewed"
      @products = Product.most_reviewed
    else
      @products = Product.three_most_recent
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Product successfully removed!"
      redirect_to products_path
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :info, :cost, :origin)
  end
end
