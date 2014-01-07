class Klass < ActiveRecord::Base
  attr_accessible :name

  has_many :students
  has_many :tests

  def get_klass_data
    klass_data = {}
    klass_data[:values] = klass_average_marks(self)
    klass_data[:key] = self.name
    klass_data[:color] = '#ff7f0e'
    klass_data
  end

  def klass_average_marks(klass)
    klass_avg_marks = []
    klass.tests.each do |test|
      test_avg_mapping = {}
      test_avg_mapping[:x] = test.id
      marks_arr = test.marks.collect(&:score)
      test_avg_mapping[:y] = marks_arr.sum/marks_arr.size
      klass_avg_marks << test_avg_mapping
    end
    klass_avg_marks
  end

end
