class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :course_code
      t.time :start_time
      t.time :end_time
      t.date :exam_date

      t.timestamps
    end
  end
end
