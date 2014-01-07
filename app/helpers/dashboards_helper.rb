module DashboardsHelper
  def students_array
    Student.all.map { |student| [student.name, student.id] }
  end

  def student_marks student
    student.marks.collect(&:score)
  end
end
