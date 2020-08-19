class WantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :course_code
  belongs_to :user
end
