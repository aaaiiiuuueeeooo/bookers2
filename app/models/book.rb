class Book < ApplicationRecord
  
  has_one_attached :image
  
  has_many :post_images,dependent: :destroy
  
end
