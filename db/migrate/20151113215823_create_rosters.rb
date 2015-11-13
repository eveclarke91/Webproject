class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.date :begin_date
      t.references :employee, index: true, foreign_key: true
      t.references :shift, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
