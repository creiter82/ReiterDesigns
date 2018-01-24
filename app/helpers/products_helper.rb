module ProductsHelper

  def feature_image product
    @featured = product.product_images.find_by(featured: true)
    if product.product_images.empty? 
      link_to holder_tag('328x200'), product_path(product) 
    else 
      link_to image_tag(@featured.image, width: '100%'), product_path(product)  
    end 
  end

end
