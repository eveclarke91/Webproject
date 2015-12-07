class Holiday < ActiveRecord::Base
  belongs_to :user
  belongs_to :employee
end
