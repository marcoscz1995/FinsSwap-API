class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.string :ta_email
      t.string :ta_give_email
      t.string :course_own
      t.string :ta_get_email
      t.string :course_want
      t.integer :cycle_id

    end
  end
end
