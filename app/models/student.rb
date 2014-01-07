class Student < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :klass_id

  belongs_to :klass
  has_many :marks
end
