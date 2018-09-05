<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
	<h2>
		<i class="fa fa-project-diagram fa-fw mr-1"></i>프로젝트 상세조회
	</h2>

	<div class="col-md-11 mt-5">

		<div class="row justify-content-center">
			<table class="col-md-10 table table-hover table-sm table-striped">
					<!-- 제목 -->
					<tr>
						<td colspan="1">프로젝트명</td><td colspan="15">${project.projectTitle }</td>
					</tr>
					<tr>
						<td colspan="1">작성자</td><td colspan="2">${project.projectLead }</td>
						<td colspan="1">시작일</td><td colspan="2">${project.projectStart }</td>
						<td colspan="1">종료일</td><td colspan="2">${project.projectEnd }</td>
						<td colspan="1">지역</td><td colspan="2">${project.locationName }</td>
						
					</tr>
					<tr>
						
					</tr>
					<!-- 본문 -->
					<tr>
						<td colspan="16">${project.projectContent }</td>
					</tr>
					<!-- 사용 기술 -->
					<tr>
						<td colspan="16" align="left">
						    	<c:forEach items="${techList}" var="tech">
						    		<c:if test="${tech.projectNo  eq project.projectNo}">
						    			<span class="badge badge-info mb-2">${tech.techName }</span>
						    		</c:if>
						    	</c:forEach>						
						</td>
					</tr>
			
			</table>
			
		</div>
		
		<div class="row justify-content-center">
			<a href="/project/project.do" class="btn btn-secondary btn-sm active mr-1"
			role="button" aria-pressed="true">목록으로</a>
			
			<!-- 글쓴사람만 수정 삭제 버튼 보이게 구현 -->	
			<a href="#" class="btn btn-secondary btn-sm active mr-1"
			role="button" aria-pressed="true">수정</a>
			
			<a href="/project/projectDelete.do?projectno=${project.projectNo }" class="btn btn-secondary btn-sm active mr-1"
			role="button" aria-pressed="true">삭제</a>

		</div>

	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>