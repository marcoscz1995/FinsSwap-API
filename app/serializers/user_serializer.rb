class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :user_id
  has_many :owns
  has_many :wants
end
