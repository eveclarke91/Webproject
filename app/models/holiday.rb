class Holiday < ActiveRecord::Base
  belongs_to :user
  belongs_to :employee

  validates :user_id, presence: true
  validates :employee_id, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  #VALID_DATE_REGEX = ^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$
  validates :finish_date, presence: true 
                        #format: { with: VALID_DATE_REGEX }
                        
  
end
