<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
 작성일 : 2018.09.08
 작성자 : 권미현
  관리자 페이지_통계
 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../main/header.jsp"%>
<link rel="stylesheet" href="../css/Main.css" />

<%@include file="../main/styleloader.jsp"%>
<div class="container m-3">
	<h1>
		<span class="far fa-chart-bar"></span> 통계
	</h1>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<label class="col-form-label">방문자 수</label>
				<div class="col-md-6">
					<select name="visitant" class="custom-select">
						<option value="day">일별</option>
						<option value="month">월별</option>
					</select>
				</div>
			</div>
			<div id="visitantChart">방문자 통계</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<br><br><br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<label class="col-form-label">게시물 수</label>
				<div class="col-md-6">
					<select name="post" class="custom-select">
						<option value="day">일별</option>
						<option value="week">주간별</option>
						<option value="month">월별</option>
					</select>
				</div>
			</div>
			<div id="postChart">게시물 통계</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>
<%@include file="../main/scriptloader.jsp"%>

<%-- 통계에 사용할 js --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>


<script type="text/javascript">

Highcharts.chart('visitantChart', {

	  title: {
	    text: '방문자 통계'
	  },

	  yAxis: {
	    title: {
	      text: '방문자 수'
	    }
	  },
	  legend: {
	    layout: 'vertical',
	    align: 'right',
	    verticalAlign: 'middle'
	  },

	  plotOptions: {
	    series: {
	      label: {
	        connectorAllowed: false
	      },
	      pointStart: 1
	    }
	  },

	  series: [{
	    name: '방문자',
	    data: [11, 3, 5, 17, 9, 11, 13, 15, 2, 3, 5, 8] // data 갯수에 따라 포인트가 달라짐
	  }],

	  responsive: {
	    rules: [{
	      condition: {
	        maxWidth: 500
	      },
	      chartOptions: {
	        legend: {
	          layout: 'horizontal',
	          align: 'center',
	          verticalAlign: 'bottom'
	        }
	      }
	    }]
	  }

	});
	
	
Highcharts.chart('postChart', {

	  title: {
	    text: '게시물 통계'
	  },

	  yAxis: {
	    title: {
	      text: '게시물 수'
	    }
	  },
	  legend: {
	    layout: '게시물',
	    align: 'right',
	    verticalAlign: 'middle'
	  },

	  plotOptions: {
	    series: {
	      label: {
	        connectorAllowed: false
	      },
	      pointStart: 1
	    }
	  },

	  series: [{
	    name: '게시물',
	    data: [5, 20, 23, 18, 13, 3, 30, 41] // data 갯수에 따라 포인트가 달라짐
	  }],

	  responsive: {
	    rules: [{
	      condition: {
	        maxWidth: 500
	      },
	      chartOptions: {
	        legend: {
	          layout: 'horizontal',
	          align: 'center',
	          verticalAlign: 'bottom'
	        }
	      }
	    }]
	  }

	});
</script>
<%@include file="../main/footer.jsp"%>