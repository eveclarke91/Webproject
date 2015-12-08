class Shift < ActiveRecord::Base
  belongs_to :user
  has_many :rosters, dependent: :destroy
  validates :user_id, presence: true
  validates :total_hours, presence: true, numericality: true
  validates :start_time, presence: true, numericality: true
  validates :finish_time, presence: true, numericality: true

 #before :save, :set_fullshift
#
  #def set_fullshift
    #fullshift = "#{start_time} #{finish_time}"
  #end
end

