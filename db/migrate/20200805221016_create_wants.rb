class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :want_id
      t.belongs_to :user, null: false, foreign_key: true
      t.string :course_code
      t.date :event_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
