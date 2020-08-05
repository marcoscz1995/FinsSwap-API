class HaveSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :course_code, :event_date, :start_time, :end_time

  belongs_to :user
end
