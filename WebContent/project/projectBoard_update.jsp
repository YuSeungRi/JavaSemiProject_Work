<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">

	<h2><i class="fa fa-project-diagram fa-fw mr-1"></i>프로젝트 수정하기</h2>

<form action="/project/projectUpdate.do" method="post" id="form">
<input type="hidden" name="projectno" value="${project.projectNo }" />	
	  <div class="form-group row mt-5">
	    <label for="title" class="col-sm-2 col-form-label">프로젝트 명</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="title" name="title" value="${project.projectTitle }">
	    </div>
	  </div>	  
	  	  
	  <div class="form-group row">
	    <div class="col-sm-2">지역</div>
	    <div class="col-sm-4">
	 	<select class="custom-select" name="location" id="location">
	 	
	 		<c:forEach items="${location }" var="location">
	 			<c:if test="${location.locationNo eq project.locationNo }">
	 				<option selected value="${location.locationNo }">${location.locationName }</option>
	 			</c:if>
	 			<c:if test="${location.locationNo ne project.locationNo }">
	 				<option value="${location.locationNo }">${location.locationName }</option>
	 			</c:if>
	 		</c:forEach>
	 		
		</select>
	    </div>
    
   		<div class="col-sm-2">인원수</div>
	    <span class="col-sm-4">
	 	<select class="custom-select" name="participant" id="participant">	 	
			<option selected>${project.projectParticpant }</option>	 		
	 		<c:forEach begin="2" end="10" step="1" var="participant">
 				<option value="${participant }">${participant }</option>
	 		</c:forEach>	 		
		</select>
	    </span>	    	    
	  </div>

	  <div class="form-group row">
	    <div class="col-sm-2">사용기술</div>
	    <div class="col-sm-10">
	    
	    	<c:forEach items="${tech }" var="tech" varStatus="stat">
	      	  <div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="inlineCheckbox${tech.techNo}" name="checkbox" value="${tech.techNo }">
				  <label class="form-check-label" for="inlineCheckbox${tech.techNo}">${tech.techName }</label>
			  </div>
	    	</c:forEach>

	    </div>
	  </div>
		
	  <div class="form-group row">
	    <div class="col-sm-2">기간</div>
		  
		  
			<fmt:parseDate var="parsedDateStart" value="${project.projectStart }" pattern="yyyy-MM-dd"/>	 
			<fmt:formatDate var="startDay" value="${parsedDateStart}" pattern="yyyy-MM-dd"/> 
			
			<div class="form-group col-md-5">
			 <label >시작일</label>
			 <input type="date" name="startday" value="${startDay }" id="startday" max="3000-12-31" 
			        min="1000-01-01" class="form-control" >
			</div>
			
			<fmt:parseDate var="parsedDateEnd" value="${project.projectEnd }" pattern="yyyy-MM-dd"/>	 
			<fmt:formatDate var="endDay" value="${parsedDateEnd}" pattern="yyyy-MM-dd"/> 
			
			<div class="form-group col-md-5">
			 <label >종료일</label>
			 <input type="date" name="endday" value=${endDay } id="endday" min="1000-01-01"
			        max="3000-12-31" class="form-control">
			</div>

	  </div>
	  
		<%-- 내용 --%>
		<%-- summernote_start --%>
		<textarea id="summernote" name="summernote">${project.projectContent }</textarea>
		
		<br>
		<%-- summernote_end --%>	  	

		<%-- 버튼 --%>
		<div class="row justify-content-around">
			<input id="btnReset" type="button" class="btn btn-secondary" value="초기화"/>
			<input id="btnBefore" type="button" class="btn btn-secondary" value="목록으로"/>
			<input id="btnWrite" type="button" class="btn btn-primary" value="등록"/>
		</div>

</form>

</div>

<%@include file="../main/scriptloader.jsp" %>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
<script type="text/javascript" src="../summernote/summernote-bs4.js" ></script>
<script type="text/javascript">
	// 버튼 이벤트
	$(document).ready(function(){
		$("#btnBefore").click(function(){
			history.back(); // 이전 화면으로 넘어가기
		});
		
		$("#btnReset").click(function(){
			$("#summernote").summernote("reset");
		});

		$("#btnWrite").click(function(){
			$("#summernote").summernote("code");
			$("#form").submit();
		});

	});
</script>


<script type="text/javascript">
    	$(document).ready(function() {
      		$('#summernote').summernote({
      			height : 300 // 높이 300 지정
      		});
    	});
</script>

<script type="text/javascript">
	$(function(){
		$("#form").submit(function(){
			var startday = $('#startday').val();
			var endday = $('#endday').val();
			
			var startArray = startday.split('-');
			var endArray = endday.split('-');
			
			var start_day = new Date(startArray[0], startArray[1], startArray[2]);
			var end_day = new Date(endArray[0], endArray[1], endArray[2]);
			
			if(start_day.getTime() > end_day.getTime()) {
				alert("종료 날짜보다 시작 날짜가 빨라야합니다.");
				return false;
			}
		});
	});
</script>

<script type="text/javascript">

 $(function(){
 	$("#form").submit(function(){

 		// 제목
 		var title = $.trim($('#title').val()); 		
 		if (title =='') {
 			alert("프로젝트명이 입력되지 않았습니다");
 			return false;
 		}
 		
 		// 지역
 		var location = $.trim($('#location').val());
 		if (location ==''|| location=='지역을 선택하세요') {
 			alert("지역이 선택되지 않았습니다");
 			return false;
 		}
 		
 		// 인원수
 		var participant = $.trim($('#participant').val());
 		if (participant == 0 ) {
 			alert("인원수가 입력되지 않았습니다");
 			return false;
 		}
 
 		// 사용기술
 		if ($('input:checkbox[name="checkbox"]:checked').length == 0 ) {
 			alert("사용기술이 선택되지 않았습니다");
 			return false;
 		}
 		
 		// 시작일
 		var startday = $.trim($('#startday').val());
 		if (startday =='') {
 			alert("시작일이 입력되지 않았습니다");
 			return false;
 		}

 		// 종료일
 		var startday = $.trim($('#endday').val());
 		if (endday =='') {
 			alert("종료일이 입력되지 않았습니다");
 			return false;
 		}
 		
 		
 		// 내용
 		var summernote = $.trim($('#summernote').val());
 		if (summernote =='') {
 			alert("본문이 입력되지 않았습니다");
 			return false;
 		}

 		
 	});
 });

</script>

<c:forEach items="${selectTech }" var="st">
	<script>
		var tech = document.getElementById("inlineCheckbox${st.techNo}");
		if(tech) {
			tech.checked="true";
		}
	</script>
</c:forEach>


<%@include file="../main/footer.jsp" %>