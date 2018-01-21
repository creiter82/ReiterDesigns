class PagesController < ApplicationController
  layout 'application'

  def home
    @product = Product.find(1)
  end

end