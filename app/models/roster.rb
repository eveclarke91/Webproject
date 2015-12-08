class Roster < ActiveRecord::Base
  belongs_to :employee
  belongs_to :shift
  belongs_to :user

  validates :user_id, presence: true
  validates :begin_date, presence:true
  validates :employee_id, presence: true
  validates :shift_id, presence: true
   
end
