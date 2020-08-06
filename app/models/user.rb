class User < ApplicationRecord
  validates :user_id, :password, :email,  presence: true
  has_many :wants
  has_many :owns
end
