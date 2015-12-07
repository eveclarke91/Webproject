class AddUserToHolidays < ActiveRecord::Migration

def self.up
    add_foreign_key :holidays, :users

  end

  
  def change
  end
end
