class Own < ApplicationRecord
  belongs_to :user
  validates_associated :, on: :create
end
