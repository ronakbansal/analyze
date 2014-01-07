class Student < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :klass_id

  belongs_to :klass
  has_many :marks

  def get_student_data
    student_data = {}
    student_data[:values] = student_graph_values(self)
    student_data[:key] = self.name
    student_data[:color] = '#2ca02c'
    student_data
  end

  def student_graph_values(student)
    student_marks = []
    student.marks.each do |mark|
      test_marks_mapping = {}
      test_marks_mapping[:x] = mark.test_id
      test_marks_mapping[:y] = mark.score
      student_marks << test_marks_mapping
    end
    student_marks
  end
end
