class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  layout 'product'

  # GET /products
  # GET /products.json
  def index
    @products = Product.order(updated_at: :desc)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @featured = @product.product_images.find_by(featured: true)
    @images = @product.product_images.where(featured: false)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "#{@product.title.titleize} was successfully created."
      redirect_to @product
    else
      render :new 
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      flash[:success] = "#{@product.title.titleize} was successfully updated." 
      redirect_to @product
    else
      render :edit 
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
      flash[:danger] = "#{@product.title.titleize} was successfully destroyed." 
      redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :desc, :price, :product_image_id)
    end
end
