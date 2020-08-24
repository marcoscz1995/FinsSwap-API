class MatchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :ta_email, :ta_give_email, :course_own, :ta_get_email, :course_want, :cycle_id
end
