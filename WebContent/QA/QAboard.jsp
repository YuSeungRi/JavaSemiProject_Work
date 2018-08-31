<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
	<h1>
		<span class="fa fa-question-circle fa-fw mr-1"></span>Q&A
	</h1>
	<div class="col mt-1">
		<div class="col-mt-11">
			<form>
				<div>
					<div class="input-group input-group-sm col-12 offset-sm-8 col-sm-4">
						<input type="text" class="text-sm form-control"
							placeholder="내용을입력하세요" aria-label=""
							aria-describedby="basic-addon1">
						<div class="input-group-append">
							<button class="btn btn-success" type="button">검색</button>
						</div>
					</div>
					<ul class="nav">
						<li class="nav-item"><a class="nav-link" href="#">최신순</a></li>
						<li class="nav-item"><a class="nav-link" href="#">조회순</a></li>
						<li class="nav-item"><a class="nav-link" href="#">추천순</a></li>
						<li class="nav-item"><a class="nav-link" href="#">댓글순</a></li>
					</ul>
				</div>
			</form>

			<div style="overflow: auto;" class="">
				<table class="table table-hover table-sm">
					<thead class="thead-light">
						<tr>
							<th>글번호</th>
							<th>작성일</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th><i class="far fa-thumbs-up fa-sm"></i></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.boardNo }</td>
							<td>${board.boardCreate }</td>
							<td>
								<a href="/question/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<td>${board.boardUser }</td>
							<td>${board.boardRead }</td>
							<td>${board.boardRecommend }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row justify-content-center">
				<div class="col-3 text-center m-1">
					<%-- 작성 버튼 --%>
					<a href="/question/write.do" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">작성</a>
				</div>
			</div>	
			<div class="row justify-content-center">
				<div class="col m-4">
					<%-- 페이지네이션 --%>
					<jsp:include page="../util/questionPaging.jsp" />
				</div>
			</div>
		</div>

	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>