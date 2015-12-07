class CreateEmployeeHolidays < ActiveRecord::Migration
  def change
    create_table :employee_holidays do |t|
      t.date :start_date
      t.date :finish_date
      t.references :employee, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
