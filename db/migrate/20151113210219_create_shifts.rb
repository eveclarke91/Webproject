class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :start_time
      t.string :finish_time
      t.decimal :total_hours
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
