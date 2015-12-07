class Shift < ActiveRecord::Base
  belongs_to :user
  has_many :rosters, dependent: :destroy
  validates :user_id, :start_time, :finish_time, :total_hours, presence: true


 #before :save, :set_fullshift
#
  #def set_fullshift
    #fullshift = "#{start_time} #{finish_time}"
  #end
end

