<%@page import="dto.ReplyDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
	<h2>
		<i class="far fa-comments fa-lg"></i>게시글 상세조회
	</h2>
	<div class="col-md-11">
		<form>
			<div>
				<div
					class="input-group input-group-sm col-12 offset-sm-8 col-sm-4 mb-2">
					<input type="text" class="text-sm form-control"
						placeholder="검색어를 입력하세요" aria-label=""
						aria-describedby="basic-addon1">
					<div class="input-group-append">
						<button class="btn btn-success" type="button">검색</button>
					</div>
				</div>
				<ul class="nav">
					<!-- <li class="nav-item"><a class="nav-link" href="#">최신순</a></li>
					<li class="nav-item"><a class="nav-link" href="#">조회순</a></li>
					<li class="nav-item"><a class="nav-link" href="#">추천순</a></li>
					<li class="nav-item"><a class="nav-link" href="#">댓글순</a></li> -->
				</ul>
			</div>
		</form>

		<div class="row justify-content-center">
			<table class="col-md-10 table table-hover table-sm table-striped">
					<!-- 제목 -->
					<tr>
						<td colspan="1">제목</td><td colspan="15">${board.boardTitle }</td>
					</tr>
					<tr>
						<td colspan="1">no.</td><td colspan="3">${board.boardNo }</td>
						<td colspan="1">작성자</td><td colspan="2">${board.boardNick }</td>
						<td colspan="1">조회수</td><td colspan="2">${board.boardRead }</td>
						<td colspan="1">작성일</td><td colspan="2">${board.boardCreate }</td>	
						<td colspan="2" id="recommend">${board.boardRecommend }</td><td colspan="1"><i class="far fa-thumbs-up fa-sm"></i></td>
					</tr>
					<tr>
					
					</tr>
					<!-- 본문 -->
					<tr>
						<td colspan="16">${board.boardContent }</td>
					</tr>
					<!-- 수정 시간 -->
					<tr>
						<td colspan="16" align="left">최근 수정 시간 : ${board.boardModify }</td>
					</tr>
			
			</table>
			
		</div>
		
		<div class="row justify-content-center">
			<a href="/question/Q&A.do" class="btn btn-secondary btn-sm active mr-1"
			role="button" aria-pressed="true">목록으로</a>
			
			<c:if test="${userId eq board.boardUser }">		
				<a href="/question/update.do?boardno=${board.boardNo }" class="btn btn-secondary btn-sm active mr-1"
				role="button" aria-pressed="true">수정</a>
				
				<a href="/question/delete.do?boardno=${board.boardNo }" class="btn btn-secondary btn-sm active mr-1"
				role="button" aria-pressed="true">삭제</a>
			</c:if>	
			
			<c:if test="${login }">
			<button id="btnRecommend" type="button" class="btn btn-secondary btn-sm active">추천</button>
			</c:if>
		</div>
		
		
		<!-- 댓글 입력 영역  -->
			<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="card mt-5"> 
					<form action="/reply/reply.do" method="post">
			 	 	<div class="form-group card-header">
			    		<label>${userNick }</label>
			  		</div>
			  		<div class="form-group ">
			    		<input type="text" class="form-control" id="boardNo" name="boardNo" value="${board.boardNo }" readonly hidden="true">
			  		</div>
			  		<div class="card-body">
			  		<div class="form-group">
			  		<%-- 수정일 : 2018.09.06 / 수정자 : 권미현 / login 체크하여 댓글 입력창 활성화 및 비활성화 --%>
			    		<c:choose>
			    			<c:when test="${login }">
			    				<textarea rows="3" class="form-control" id="replyContent" name="replyContent" placeholder="댓글을 입력해주세요." ></textarea>
			    			</c:when>
			    			<c:when test="${!login }">
			    				<textarea rows="3" class="form-control" id="replyContent" name="replyContent" placeholder="로그인 상태여야 입력 가능합니다." readonly ></textarea>
			    			</c:when>
			    		</c:choose>
			  		</div>
			  		<%-- 수정일 : 2018.09.06 / 수정자 : 권미현 / 버튼 설정(id, type) --%>
			  		<button id="btnReply" type="button" class="btn btn-primary  btn-sm mr-1">댓글 입력</button>
			  		</div>
					</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		
		<!-- 댓글 목록 영역 -->
		<div class="row mt-3 justify-content-center">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<ul class="list-group">
					<c:forEach items="${replyList}" var="reply">
						<li class="list-group-item">
							<div class="d-flex w-100 justify-contents-between">
								<%-- 수정일 : 2018.09.05 / 수정자 : 권미현 / 작성자:${reply.userEmail } → 작성자:${reply.userNick }  --%>
								<small>작성자 : ${reply.userNick }, 작성일 : ${reply.replyCreate } &nbsp</small>
								<c:if test="${userId eq reply.userEmail }">
									<%-- 수정일 : 2018.09.07 / 수정자 : 권미현 / <button> → <a> 로 변경, 링크 연결 --%>
									<small>
										<a href="/reply/delete.do?replyno=${reply.replyNo }&boardno=${board.boardNo }" style="color: red;">삭제</a>
									</small>
								</c:if>
							</div>
							<div>
								<p class="mb-1">${reply.replyContent }</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>

<%@include file="../main/scriptloader.jsp" %>
<script type="text/javascript">

	// 추천한 게시글이면 "추천 취소"로 보이도록 설정
	// 추천하지 않은 게시글이면 "추천"으로 보이도록 설정
	if(${recommend }) { //추천상태
		$("#btnRecommend")
			.addClass("btn-danger")
			.removeClass("btn-primary")
			.text("추천 취소");
	} else {	//추천 안 한상태
		$("#btnRecommend")
			.addClass("btn-primary")
			.removeClass("btn-danger")
			.text("추천");
	}
	
	// 추천 버튼 클릭 이벤트 처리
	$("#btnRecommend").click(function() {
		$.ajax({
			type: "get"
			, url: "/recommend/recommend.do"
			, dataType: "json"
			, data: {
				boardno: '${board.boardNo }'
			}
			, success: function(data) {
					console.log("success");
				console.log(data);
				
				//추천 버튼 색상 변경
				$("#btnRecommend")
					.toggleClass("btn-primary")
					.toggleClass("btn-danger");
	
				//추천수 갱신
				$("#recommend").text(data.recommend);
				
				//추천 버튼 텍스트 변경
				if(data.result) {
					$("#btnRecommend").text("추천 취소");
				} else {
					$("#btnRecommend").text("추천");
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