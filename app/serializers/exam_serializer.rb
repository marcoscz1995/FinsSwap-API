class ExamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :course_code, :start_time, :end_time, :exam_date
end
