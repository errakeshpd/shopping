class LineItemsController < ApplicationController
#  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :if_product_exist, only: [:create]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
          @line_item = LineItem.new
          @line_item.product_id = params[:product_id]
          @line_item.cart_id = @cartid
    respond_to do |format|
      if @line_item.save
          format.html { redirect_to @line_item.cart }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_cart
      @cartid =1
  end
  def if_product_exist
      @line_items = LineItem.where("product_id=?", params[:product_id]).all
      @line_records = @line_items.where("cart_id=?",1).all
      @count = @line_records.count
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
  #    @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
 #       params.require(:line_item).permit(:product_id)
 #     params.require(:line_item).permit(:product_id, :cart_id)
    end
end
