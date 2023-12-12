class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :request  ,dependent: :destroy
  has_many :review   ,dependent: :destroy
  has_one_attached :perfil_img

end
