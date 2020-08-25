class CreateAlgorithms < ActiveRecord::Migration[6.0]
  def change
    create_table :algorithms do |t|
      t.boolean :run, :default => false

      t.timestamps
    end
  end
end
