class Product < ApplicationRecord
  has_many :product_images
  
  validates :title, presence: true, uniqueness: true
  validates_presence_of :desc, :price
end
