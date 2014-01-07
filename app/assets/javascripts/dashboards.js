$(document).ready(function(){
  get_student_data(1);
  $('#student_id').change(function() {
    student_id = $("#student_id option:selected").attr("value");
    get_student_data(student_id);
    });
});

function get_student_data(student_id){
   $.getJSON( "student_data.json?id=" + student_id, function(student_data) {
   generate_graph(student_data);
   });
}

function generate_graph(student_data){
  d3.json("klass_data.json",function(klass_data){
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
      .datum([klass_data, student_data])
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


