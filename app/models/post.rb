class Post < ApplicationRecord
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_categories
  has_many :categories, through: :post_categories


end
