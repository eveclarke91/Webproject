class Shift < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :start_time, :finish_time, :total_hours, presence: true

end
