class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :password
end
