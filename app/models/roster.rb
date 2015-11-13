class Roster < ActiveRecord::Base
  belongs_to :employee
  belongs_to :shift
  belongs_to :user

  validates :user_id, :employee_id, :shift_id, presence: true
end
