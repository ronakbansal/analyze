$(document).ready(function(){
  student =  gon.student_data;
  student_data = {values: student, key: 'Student', color: '#2ca02c'}
  generate_graph(student_data);
  $('#student_id').change(function() {
    var val = $("#student_id option:selected").attr("value");
    marks_arr = val.split(",");
    student = [{x: 1, y: parseInt(marks_arr[0])}, {x: 2, y: parseInt(marks_arr[1])}, {x: 3, y: parseInt(marks_arr[2])}]
    student_data = {values: student, key: 'Student', color: '#2ca02c'}
    generate_graph(student_data);
  });
});

function generate_graph(student_data){
  d3.json("data.json",function(data){
    nv.addGraph(function() {
      chart = nv.models.lineChart()
           .margin({top: 50, right: 50, bottom: 50, left: 100});
      chart.xAxis
      .axisLabel('Tests')
      .tickFormat(x_format);

      chart.yAxis
      .axisLabel('Percentage')
      .tickFormat(function(d) { return d + "%"; });

      d3.select('#chart svg')
      .datum([data, student_data])
      .transition().duration(500)
      .call(chart);

      nv.utils.windowResize(chart.update);

      return chart;
    });
  });
}

x_format = function(num) {
    if (num === 1)
        return "FA1";
    else if (num === 2)
        return "FA2";
    else if (num === 3)
        return "SA1";
};


