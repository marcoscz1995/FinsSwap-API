class User < ApplicationRecord
  has_many :haves
  has_many :wants
end
