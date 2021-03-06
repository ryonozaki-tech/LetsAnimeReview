class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 6 }
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

end
