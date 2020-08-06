class User < ApplicationRecord
  validates :password, presence: true
  validates :email, presence: true,  format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_many :wants, :owns
end
