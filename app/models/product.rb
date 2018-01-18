class Product < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates_presence_of :desc, :price
end
