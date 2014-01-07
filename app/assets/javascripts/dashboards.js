$(document).ready(function(){

  var data = function() {
  return [
    {
      values: gon.class_data,
      key: 'Class 9A',
      color: '#ff7f0e'
    },
    {
      values: gon.student_data,
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
});
