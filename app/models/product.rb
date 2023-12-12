class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {title: 'A', description: 'B'}
  has_one_attached :picture 
  belongs_to :user
  validates :title, presence: true

  validates :description, presence: true


  validates :price, presence: true

  has_many :request , dependent: :destroy

  has_many :review , dependent: :destroy

  belongs_to :category 
end
