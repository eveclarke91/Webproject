class Employee < ActiveRecord::Base
  belongs_to :user
  has_many :rosters, dependent: :destroy
  has_many :holidays, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 9..30 }
  validates :address, presence: true, length: { maximum: 140 }
  validates :number,   :presence => {:message => 'Not a valid Phone Number'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }
 validates :rate_of_pay, presence: true, numericality: true
  
  default_scope -> { order(created_at: :desc) }

end
