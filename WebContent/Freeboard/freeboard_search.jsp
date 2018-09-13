<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
	<h1>
		<span class="fa fa-laptop fa-fw mr-1"></span>자유게시판 검색결과
	</h1>
	<div class="col mt-1">
		<div class="col-mt-11">
			<form action="/Freeboard/search.do" name="search" method="get">	
				<div>
					<div class="input-group input-group-sm col-12 offset-sm-8 col-sm-4 my-3">
						<select name="keyField" size="1">
						<option value="title" <c:if test='${keyField eq "title" }'> selected</c:if>> 제목 </option>
						<option value="content" <c:if test='${keyField eq "content" }'> selected</c:if>> 내용 </option>
						</select>
						<input type="text" class="text-sm form-control"
							placeholder="내용을입력하세요" required="required" aria-label=""
							aria-describedby="basic-addon1" name="searchString" <c:if test="${searchString ne null}">value="${ searchString}"</c:if> />
						<div class="input-group-append">
							<button class="btn btn-success" type="submit">검색</button>
						</div>
					</div>
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
								<a href="/Freeboard/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<td>${board.boardNick }</td>
							<td>${board.boardRead }</td>
					    	<td>${board.boardRecommend }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row justify-content-center">
				<div class="col-3 text-center m-1">
					<%-- 게시판으로 돌아가기 버튼 --%>
					<a href="/Freeboard/free.do" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">돌아가기</a>
				</div>
			</div>	
			<div class="row justify-content-center">
				<div class="col m-4">
					<%-- 페이지네이션 --%>
					<jsp:include page="/util/boardsearchPaging.jsp" />
				</div>
			</div>
		</div>

	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>