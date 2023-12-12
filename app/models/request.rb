class Request < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :amount, presence: true
  validates :adress, presence: true
  validates :email, presence: true
end
