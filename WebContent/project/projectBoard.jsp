<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
	<h1>
		<span class="fa fa-project-diagram fa-fw mr-1"></span>프로젝트
	</h1>
    
    <div class="col-md-12 mt-4">
	<div class="card">
	  <div class="card-header">
	    프로젝트 검색하기
	  </div>
	  
	<div class="card-body">
	
    <form action = "/project/search.do" method="post" id="form">    
	  <div class="form-group row">
	    <label for="title" class="col-sm-2 col-form-label">프로젝트 명</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="title" placeholder="프로젝트명을 입력하세요">
	    </div>
	  </div>	  
	  	  
	  <div class="form-group row">
	    <div class="col-sm-2">지역</div>
	    <div class="col-sm-10">
	 	<select class="custom-select" name="location" id="location">	 	
			<option selected>지역을 선택하세요</option>	 		
	 		<c:forEach items="${location }" var="location">
 				<option value="${location.locationNo }">${location.locationName }</option>
	 		</c:forEach>	 		
		</select>
	    </div>
	  </div>	  

	  <div class="form-group row">
	    <div class="col-sm-2">사용기술</div>
	    <div class="col-sm-10">
	    
	    	<c:forEach items="${tech }" var="tech" varStatus="stat">
	      	  <div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox${stat.index+1}" name="checkbox" value="${tech.techNo }">
			  <label class="form-check-label" for="inlineCheckbox${stat.index+1}">${tech.techName }</label>
			</div>
	    	</c:forEach>		
			
	    </div>
	  </div>
	  
	  <div class="form-group row">
	    <div class="col-sm-2">기간</div>
		  
			<div class="form-group col-md-5">
			 <label >시작일</label>
			 <input type="date" name="startday" id="startday" max="3000-12-31" 
			        min="1000-01-01" class="form-control">
			</div>
			
			<div class="form-group col-md-5">
			 <label >종료일</label>
			 <input type="date" name="endday" id="endday" min="1000-01-01"
			        max="3000-12-31" class="form-control">
			</div>

	  </div>	  

	  <div class="form-group row justify-content-end">

	      <button type="submit" class="btn btn-primary btn-sm mx-2">검색하기</button>
	      <button type="reset" class="btn btn-default btn-sm mx-2">초기화</button>
	      
	  </div>
	  	  
	</form>
	
    </div>
    </div>
    </div>	
    
    <!-- 프로젝트 검색하기 작성완료 -->
      
    			<div class="col-md-12">
    			
    			<a href="/project/projectWrite.do" class="btn btn-secondary btn-sm active mt-3 mx-10 mb-2" role="button" aria-pressed="true">프로젝트 등록하기</a>

					<c:forEach items="${projectList }" var="project">
					<ul class="list-group list-group-flush">
					  <li class="list-group-item">

							
  							<div class="card">
							  <div class="card-body">
							  
							    <h5 class="card-title">${project.projectTitle }</h5>
							    
							    <fmt:parseDate var="parsedDateStart" value="${project.projectStart }" pattern="yyyy-MM-dd"/>
							    <fmt:formatDate var="startDay" value="${parsedDateStart}" pattern="yyyy-MM-dd"/>​
							    <span class="card-text mr-5">시작일 : ${startDay }</span>
  							    <fmt:parseDate var="parsedDateEnd" value="${project.projectEnd }" pattern="yyyy-MM-dd"/>
							    <fmt:formatDate var="endday" value="${parsedDateEnd}" pattern="yyyy-MM-dd"/>​
							    <span class="card-text mr-5">종료일 : ${endday }</span>
							    <span class="card-text mr-5">작성자 : ${project.projectNick } (${project.projectLead })</span>
							    <span class="card-text mr-5">지역 : ${project.locationName }</span>
							    <p class="card-text mt-3">${project.projectContent }</p>	

						    	<c:forEach items="${techList}" var="tech">
						    		<c:if test="${tech.projectNo  eq project.projectNo}">
						    			<span class="badge badge-info mb-2">${tech.techName }</span>
						    		</c:if>
						    	</c:forEach>		   				
							    
							    <div class="text-right"><a href="/project/projectView.do?projectno=${project.projectNo }" class="btn-sm btn-primary">자세히보기</a></div>
							  </div>
							</div>
							
							
					  </li>
					</ul>
					</c:forEach>	
					
			<div class="row justify-content-center">
				<div class="col m-4">
				<!-- 페이지네이션 -->
				<jsp:include page="/util/projectPaging.jsp" />
				</div>
			</div>				
		
	<!-- 작성완료 -->	
	
</div>
</div>
<%@include file="../main/scriptloader.jsp" %>

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

<%@include file="../main/footer.jsp"%>