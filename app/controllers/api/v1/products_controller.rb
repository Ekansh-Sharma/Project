module Api
  class V1::ProductsController < ApplicationController
    skip_before_filter  :verify_authenticity_token
    protect_from_forgery :except => [:create]

    def create
      product = Product.new(product_params)
      respond_to do |format|

        if product.save
          format.json { render json: {message: 'Successfully Created.'}, status: :created }
        else
          format.json { render json: { erorrs: product.errors }, status: :unprocessable_entity }
        end
      end
    end

    private

    def product_params
      params.require(:product).permit(:expire_date, :name, :sku_id,
                                      { categories: [] },
                                      { tags: [] },
                                      { images: [:img_path] },
                                      :price,
                                      :description)
    end
  end
end