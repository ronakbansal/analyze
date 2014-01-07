class DashboardsController < ApplicationController
  def show
    @klass = Klass.first
    @students = Student.all
    test1_marks = Mark.where(test_id: Test.where(name: "FA1").last.id)
    @test1_avg = test1_marks.collect(&:score).sum / test1_marks.count
    test2_marks = Mark.where(test_id: Test.where(name: "FA2").last.id)
    @test2_avg = test2_marks.collect(&:score).sum / test2_marks.count
    test3_marks = Mark.where(test_id: Test.where(name: "SA1").last.id)    
    @test3_avg = test1_marks.collect(&:score).sum / test3_marks.count
    gon.class_data = [{x: 1, y: @test1_avg}, {x: 2, y: @test2_avg}, {x: 3, y: @test3_avg}]
    gon.student_data = [{x: 1, y: Mark.where(student_id: 1, test_id: 1).last.score}, {x: 2, y: Mark.where(student_id: 1, test_id: 2).last.score}, {x: 3, y: Mark.where(student_id: 1, test_id: 3).last.score}]

    respond_to do |format|
      format.html
    end
  end

  def data
    a = []
    b  ={}
    b[:values] = [{x: 1, y: 76}, {x: 2, y: 84}, {x: 3, y: 92}]
    b[:key] = 'Class 9A'
    b[:color] = '#ff7f0e'
    a << b
    respond_to do |format|
      format.json { render json: b}
    end
  end
end
