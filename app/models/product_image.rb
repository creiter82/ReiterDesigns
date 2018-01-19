class ProductImage < ApplicationRecord
  belongs_to :product

  validates_presence_of :image, :product_id
end
