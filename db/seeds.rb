# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

klass = Klass.create(name: "Class 9A")

20.times do |i|
  Student.create(name: "Student#{i+1}", klass_id: klass.id)
end

["FA1", "FA2", "SA1"].each do |i|
  Test.create(name: i, klass_id: klass.id)
end

marks = [[66,76,61],[48,84,97],[91,92,49],[78,73,76],[52,62,63],[84,36,69],[62,88,94],[65,86,58],[94,36,42],[90,97,98],[59,58,90],[49,44,73],[70,73,30],[77,32,34],[47,40,35],[78,87,81],[77,39,83],[43,44,35],[48,87,31],[43,79,45]]
temp = 0
Student.all.each do |i|
  temp1 = 0
  Test.all.each do |j|
    Mark.create(score: marks[temp][temp1], test_id: j.id, student_id: i.id)
    temp1 += 1
  end
  temp +=1
end
