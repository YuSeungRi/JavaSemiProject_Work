<%@page import="dto.StatisticsVisitantDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
 작성일 : 2018.09.08
 작성자 : 권미현
  관리자 페이지_통계
  
 수정일 : 2018.09.13
 수정자 : 권미현
  - 관리자 페이지_통계 : 게시물 삭제
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
					<%-- onchange="select(this.value)" : 옵션이 바뀔 때마다 함수 발생 --%>
					<select onchange="select(this.value)" name="visitant" class="custom-select">
						<option value="day" <c:if test="${visitant eq 'day' }">selected="selected"</c:if>>일별</option>
						<option value="month" <c:if test="${visitant eq 'month' }">selected="selected"</c:if>>월별</option>
					</select>
				</div>
			</div>
			<div id="visitantChart">방문자 통계</div>
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

	var visitant = new Array();

	<%-- jstl : forEach문을 이용한 값(list/방문자 수) 받아오기 --%>
	<c:forEach items="${vList }" var="v">
		var data = new Object();
		data = Number("${v.visitantNum }");
		visitant.push(data);
	</c:forEach>

	console.log(visitant);

	Highcharts.chart('visitantChart', {

		title : {
			text : '방문자 통계'
		},

		yAxis : {
			title : {
				text : '방문자 수'
			}
		},
		legend : {
			layout : 'vertical',
			align : 'right',
			verticalAlign : 'middle'
		},

		plotOptions : {
			series : {
				label : {
					connectorAllowed : false
				},
				pointStart : 1
			}
		},

		series : [ {
			name : '방문자',
			data : visitant // data 갯수에 따라 포인트가 달라짐
		} ],

		responsive : {
			rules : [ {
				condition : {
					maxWidth : 500
				},
				chartOptions : {
					legend : {
						layout : 'horizontal',
						align : 'center',
						verticalAlign : 'bottom'
					}
				}
			} ]
		}

	});

</script>

<script type="text/javascript">
	function select(val) {
		// 받아온 val 값 적용하기(select-option value 값)
		location.href="/admin/statistics.do?visitant=" + val;
	}
</script>
<%@include file="../main/footer.jsp"%>