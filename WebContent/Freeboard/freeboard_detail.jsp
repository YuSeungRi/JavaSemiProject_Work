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
						<td colspan="1">작성자</td><td colspan="2">${board.boardUser }</td>
						<td colspan="1">조회수</td><td colspan="2">${board.boardRead }</td>
						<td colspan="1">작성일</td><td colspan="2">${board.boardCreate }</td>	
						<td colspan="2">${board.boardRecommand }</td><td colspan="1"><i class="far fa-thumbs-up fa-sm"></i></td>
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
			<a href="/Freeboard/free.do" class="btn btn-secondary btn-sm active"
			role="button" aria-pressed="true">목록으로</a>
				
			<a href="/Freeboard/update.do?boardno=${board.boardNo }" class="btn btn-secondary btn-sm active"
			role="button" aria-pressed="true">수정</a>
			
			<a href="/Freeboard/delete.do?boardno=${board.boardNo }" class="btn btn-secondary btn-sm active"
			role="button" aria-pressed="true">삭제</a>
		</div>
		<!-- 댓글 영역  -->
		<div class="row" id="replyDisplay" > 
			<c:import url="/reply/reply.do?boardNo=${param.boardno }" />
		</div>
	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>