class Post < ApplicationRecord
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode

  with_options presence: true do
    validates :place_name
    validates :body
    validates :category_ids
    validates :image
    validates :latitude
    validates :longitude
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_categories
  has_many :categories, through: :post_categories


end
