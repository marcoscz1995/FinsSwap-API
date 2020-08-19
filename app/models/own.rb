class Own < ApplicationRecord
  validates  :course_code , presence: true
  belongs_to :user


end
