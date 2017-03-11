class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(update_product_params)
      redirect_to admin_products_path
    else
      flash[:error] = @product.errors
    end
  end

  private

  def update_product_params
    prod_params = params.require(:product).permit(:expire_date, :name,
                                                  { categories: [] },
                                                  { tags: [] },
                                                  :price,
                                                  :description,
                                                  :admin_approved)
    prod_params[:categories] = [] if prod_params[:categories].blank?
    prod_params[:tags] = [] if prod_params[:tags].blank?
    prod_params
  end
end
