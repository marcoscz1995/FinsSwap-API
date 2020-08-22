class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :wants
  has_many :owns

  # after_create :user_id_ify

  # def user_id_ify
    # user.update_attributes(user_id: id)
    # self.user_id = id
  # end
end
