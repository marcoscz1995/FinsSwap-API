class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :password

  has_many :haves
  has_many :wants
end
