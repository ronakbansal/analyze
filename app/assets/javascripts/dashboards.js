$(document).ready(function(){
  student =  gon.student_data;
  generate_graph(student);
  $('#student_id').change(function() {
    var val = $("#student_id option:selected").attr("value");
    marks_arr = val.split(",");
    student = [{x: 1, y: parseInt(marks_arr[0])}, {x: 2, y: parseInt(marks_arr[1])}, {x: 3, y: parseInt(marks_arr[2])}]
    generate_graph(student);
  });
});
function generate_graph(student){
  var data = function() {
    return [
      {
      values: gon.class_data,
      key: 'Class 9A',
      color: '#ff7f0e'
    },
    {
      values: student,
      key: 'Student',
      color: '#2ca02c'
    }
    ];
  }

  nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
    .axisLabel('Tests')
    .tickValues([1, 2, 3]);

    chart.yAxis
    .axisLabel('Percentage');

    d3.select('#chart svg')
    .datum(data())
    .transition().duration(500)
    .call(chart);

    nv.utils.windowResize(chart.update);

    return chart;
  });

}


