class Employee < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :rate_of_pay,  presence: true

end
