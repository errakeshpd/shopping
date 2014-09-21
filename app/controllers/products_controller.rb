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
        respond_to do |format| 
            if @product.save 
                format.html { redirect_to '/', notice: 'Product was successfully created.' } 
                format.json { render :show, status: :created, location: @product } 
            else 
                format.html { render :new } 
                format.json { render json: @product.errors, status: :unprocessable_entity } 
            end 
        end 

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
