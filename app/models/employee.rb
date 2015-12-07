class Employee < ActiveRecord::Base
  belongs_to :user
  has_many :rosters, dependent: :destroy
  has_many :holidays, dependent: :destroy

  validates :user_id, :rate_of_pay,  presence: true
  
  default_scope -> { order(created_at: :desc) }

end
