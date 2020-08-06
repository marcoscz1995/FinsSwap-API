class Own < ApplicationRecord
  validates  :course_code, :event_date, :start_time, :end_time, presence: true
  validate :end_must_be_after_start
  belongs_to :user

  private

  def end_must_be_after_start
      if start_time >= end_time
            errors.add(:end_time, "must be after start time")
      end
  end
end
