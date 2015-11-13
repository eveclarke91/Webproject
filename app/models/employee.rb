class Employee < ActiveRecord::Base
  belongs_to :user
  has_many :rosters, dependant:, :destroy
  has_many :holidays, dependant:, :destroy

  validates :user_id, :rate_of_pay,  presence: true

end
