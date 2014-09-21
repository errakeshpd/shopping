class ProductsController < ApplicationController
    before_action :set_product, only: [:edit , :show, :destroy,:update]

    def index
        @products = Product.all
    end
    def show
    end
    def new
        @product =Product.new
    end
    def edit
    end
    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to :action => :index
    end
    def destroy
        @product.destroy
    end


    private
    def set_product
        @product = Product.find(params[:id])
    end
    def product_params
        params.require(:product).permit(:title, :description, :image_url, :price)
    end


end
