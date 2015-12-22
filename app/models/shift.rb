class Shift < ActiveRecord::Base
  belongs_to :user
  has_many :rosters, dependent: :destroy
  validates :user_id, presence: true
  validates :total_hours, presence: true, numericality: true
  validates :start_time, presence: true
  validates :finish_time, presence: 

  def fullshift
    "#{self.start_time} to #{self.finish_time}"
  end

end

