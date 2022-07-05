class Post < ApplicationRecord
  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy
end
