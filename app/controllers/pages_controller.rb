class PagesController < ApplicationController
  layout 'application'

  def home
    @product = Product.find(1)
    @featured = @product.product_images.find_by(featured: true)
    @images = @product.product_images.where(featured: false)

  end

end