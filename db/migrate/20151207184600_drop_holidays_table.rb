class DropHolidaysTable < ActiveRecord::Migration
  def self.up
    drop_table :holidays
  end

 def self.down
    raise ActiveRecord::IrreversibleMigration
    
 end
end