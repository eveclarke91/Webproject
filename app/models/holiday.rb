class Holiday < ActiveRecord::Base
  belongs_to :employee

  validates :employee_id, :start_date, :finish_date, presence: true

end
