class Mark < ActiveRecord::Base
  attr_accessible :score
  attr_accessible :student_id
  attr_accessible :test_id

  belongs_to :student
  belongs_to :test
end
