class DashboardsController < ApplicationController
  def show
    @klass = Klass.first
    @students = Student.all

    respond_to do |format|
      format.html
    end
  end

  def klass_data
    klass = Klass.first
    klass_data = klass.get_klass_data

    respond_to do |format|
      format.json { render json: klass_data}
    end
  end

  def student_data
   student = Student.where(id: params[:id]).first
   student_data = student.get_student_data

   respond_to do |format|
     format.json { render json: student_data}
   end
  end
end
