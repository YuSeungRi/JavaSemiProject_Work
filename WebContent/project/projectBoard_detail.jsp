<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
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
						<td colspan="1">작성자</td><td colspan="2">${project.projectNick } (${project.projectLead })</td>
					    <fmt:parseDate var="parsedDateStart" value="${project.projectStart }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="startDay" value="${parsedDateStart}" pattern="yyyy-MM-dd"/>​
						<td colspan="1">시작일</td><td colspan="2">${startDay }</td>
  					 	<fmt:parseDate var="parsedDateEnd" value="${project.projectEnd }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="endday" value="${parsedDateEnd}" pattern="yyyy-MM-dd"/>​
						<td colspan="1">종료일</td><td colspan="2">${endday }</td>
						
						
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
						<td colspan="1">사용기술</td>
						<td colspan="16" align="left">
						    	<c:forEach items="${techList}" var="tech">
						    		<c:if test="${tech.projectNo  eq project.projectNo}">
						    			<span class="badge badge-info mb-2">${tech.techName }</span>
						    		</c:if>
						    	</c:forEach>						
						</td>
					</tr>
					
					<tr>
						
					</tr>
					
					<!-- 참가 -->

					<tr>
						<td colspan="1">참가인원</td>
						<td td colspan="16" > (
						<span id="participate">	${cnt }						
						</span>	
						<span id="participate2">
						/ ${project.projectParticpant } )
						</span>
						</td>
					
					</tr>
					
					<tr></tr>
					
					<tr>
						<td colspan="1">참가자</td>
						<td colspan="16" align="left" id="userinfo">
					    	<c:forEach items="${userList}" var="user">
					    		<c:if test="${user.projectNo  eq project.projectNo}">
					    			<span class="badge badge-warning mb-2">${user.projectUserNick } (${user.projectUserMail })</span>
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
			<a href="/project/projectUpdate.do?projectno=${project.projectNo }" class="btn btn-secondary btn-sm active mr-1"
			role="button" aria-pressed="true">수정</a>
			
			<a href="/project/projectDelete.do?projectno=${project.projectNo }" class="btn btn-secondary btn-sm active mr-1"
			role="button" aria-pressed="true">삭제</a>
			
			<c:if test="${login }">
			<button id="btnParticipate" type="button" class="btn btn-secondary btn-sm active">참가하기</button>
			</c:if>			

		</div>

	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>

<script type="text/javascript">

	// 추천한 게시글이면 "추천 취소"로 보이도록 설정
	// 추천하지 않은 게시글이면 "추천"으로 보이도록 설정
	if(${participate }) { //추천상태
		$("#btnParticipate")
			.addClass("btn-danger")
			.removeClass("btn-primary")
			.text("참가 취소");
	} else {	//추천 안 한상태
		$("#btnParticipate")
			.addClass("btn-primary")
			.removeClass("btn-danger")
			.text("참가하기");
	}
	
	// 추천 버튼 클릭 이벤트 처리
	$("#btnParticipate").click(function() {
		
		var num1 = $.trim($('#participate').val());
		var num2 = $.trim($('#participate2').val());
		
		if(num1>=num2) {
 			alert("참가 가능 인원을 초과하였습니다");
 			return false;
 		}
		
		$.ajax({
			type: "get"
			, url: "/project/participate.do"
			, dataType: "json"
			, data: {
				projectno: '${project.projectNo }'				
			}
			, success: function(data) {
					console.log("success");
				console.log(data);
				
				//추천 버튼 색상 변경
				$("#btnParticipate")
					.toggleClass("btn-primary")
					.toggleClass("btn-danger");
	
				//추천수 갱신
				$("#participate").text(data.participate);
				
				location.reload();
				
				//추천 버튼 텍스트 변경
				if(data.result) {
					$("#btnParticipate").text("참가 취소");
				} else {
					$("#btnParticipate").text("참가하기");
				}
			
				
			}
			, error: function(e) {
					console.log("fail");
				
				console.log(e.responseText);
			}
		});		
		
	});

</script>	



<%@include file="../main/footer.jsp"%>