class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  with_options presence: true do
    validates :name
    validates :name_kana
    validates :email
    validates :address
    validates :post_code
    validates :phone_number
  end
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  
end
