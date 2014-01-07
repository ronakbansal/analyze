module DashboardsHelper
  def students_array
    Student.all.map { |student| [student.name, student.marks.collect(&:score).join(",")] }
  end

  def student_marks student
    student.marks.collect(&:score)
  end
end
