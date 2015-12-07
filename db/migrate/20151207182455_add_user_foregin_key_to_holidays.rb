class AddUserForeginKeyToHolidays < ActiveRecord::Migration
  def self.up
    add_foreign_key :holidays, :users

  end

  def self.down
    remove_foreign_key :holidays, :users

end
end