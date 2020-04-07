<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat date = new SimpleDateFormat("YYMMdd");
	SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd");
	
	Calendar today = Calendar.getInstance();
	today.add(Calendar.DATE, 0);

	Calendar tarday = Calendar.getInstance();
	tarday.add(Calendar.DATE , -7);
	
	String tarDay = date.format(tarday.getTime());
	String toDay = date.format(today.getTime());
	String toDay2 = date2.format(today.getTime());
	
	request.setAttribute("toDay", toDay);
	request.setAttribute("toDay2", toDay2);
	request.setAttribute("tarDay", tarDay);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#chart_div{
		width: 700px;
		height: 300px; 
	}
</style>
</head>
<body>
	<div id="chart_div"></div>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script type="text/javascript">
	$(function() {
		
		$.ajax({
			url: "http://localhost:5000/daySalesAmt?setDate=${toDay2}&count=7",
			type: "POST",
			dataType: "json"
		}).done(function(data) {
			viewChart(data);
		});
		
	});
	
	function viewChart(json_data) {
		
		am4core.useTheme(am4themes_animated);
		
		var chart = am4core.create("chart_div", am4charts.XYChart);
		
		chart.data = json_data
		
		// Create axes
		var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
		dateAxis.renderer.grid.template.location = 0;
		dateAxis.renderer.minGridDistance = 50;

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.logarithmic = true;
		valueAxis.renderer.minGridDistance = 20;

		// Create series
		var series = chart.series.push(new am4charts.LineSeries());
		series.dataFields.valueY = "totalAmt";
		series.dataFields.dateX = "date";
		series.tensionX = 0.8;
		series.strokeWidth = 3;

		var bullet = series.bullets.push(new am4charts.CircleBullet());
		bullet.circle.fill = am4core.color("#fff");
		bullet.circle.strokeWidth = 3;

		// Add cursor
		chart.cursor = new am4charts.XYCursor();
		chart.cursor.fullWidthLineX = true;
		chart.cursor.xAxis = dateAxis;
		chart.cursor.lineX.strokeWidth = 0;
		chart.cursor.lineX.fill = am4core.color("#000");
		chart.cursor.lineX.fillOpacity = 0.1;

		// Add scrollbar
		chart.scrollbarX = new am4core.Scrollbar();

		// Add a guide
		let range = valueAxis.axisRanges.create();
		range.value = 90.4;
		range.grid.stroke = am4core.color("#396478");
		range.grid.strokeWidth = 1;
		range.grid.strokeOpacity = 1;
		range.grid.strokeDasharray = "3,3";
		range.label.inside = true;
		range.label.text = "Average";
		range.label.fill = range.grid.stroke;
		range.label.verticalCenter = "bottom";

	}

</script>
</body>
</html>