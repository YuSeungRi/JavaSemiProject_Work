<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>

<%-- 수정일 : 2018.09.03 / 수정자 : 권미현 / 정렬, 상세(내용) 조회 페이지 연결--%>
<div class="container m-3">
	<h1>
		<span class="fa fa-users fa-fw mr-1"></span>구인구직
	</h1>
	<div class="col mt-1">
		<div class="col-mt-11">
			<form>
				<div>
		<!--  			<div class="input-group input-group-sm col-12 offset-sm-8 col-sm-4">
						<input type="text" class="text-sm form-control"
							placeholder="내용을입력하세요" aria-label=""
							aria-describedby="basic-addon1">
						<div class="input-group-append">
							<button class="btn btn-success" type="button">검색</button>
						</div>
					</div> -->
					<ul class="nav">
						<li class="nav-item"><a class="nav-link" href="/recruit/recruit.do?curPage=${paging.curPage }&order=create">최신순</a></li>
						<li class="nav-item"><a class="nav-link" href="/recruit/recruit.do?curPage=${paging.curPage }&order=read">조회순</a></li>
						<li class="nav-item">
							<select  onchange="select(this.value)"  name="status" class="custom-select">
								<option hidden="">상태 선택</option>
								<option value="jobOffer" <c:if test="${order eq 'jobOffer'}">selected="selected"</c:if>>구인</option>
								<option value="jobOfferComplete" <c:if test="${order eq 'jobOfferComplete'}">selected="selected"</c:if>>구인완료</option>
								<option value="jobHunt" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>구직</option>
								<option value="jobHuntComplete" <c:if test="${order eq 'jobHuntComplete'}">selected="selected"</c:if>>구직완료</option>
							</select>
						</li>
					</ul>
				</div>
			</form>

			<div style="overflow: auto;" class="">
				<table class="table table-hover table-sm mt-1">
					<thead class="thead-light">
						<tr>
							<th>글번호</th>
							<th>작성일</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>상태</th>	
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.boardNo }</td>
							<td>${board.boardCreate }</td>
							<td>
								<a href="/recruit/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<%-- 수정일 : 2018.09.04 / 수정자 : 권미현 / ${board.boardUser } → ${board.boardNick } --%>
							<td>${board.boardNick }</td>
							<td>${board.boardRead }</td>
							<td>${board.recruitStatus }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row justify-content-center">
				<div class="col-3 text-center m-1">
					<%-- 작성 버튼 --%>
					<a href="/recruit/write.do" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">작성</a>
				</div>
			</div>	
			<div class="row justify-content-center">
				<div class="col m-4">
					<%-- 페이지네이션 --%>
					<jsp:include page="/util/recruitPaging.jsp" />
				</div>
			</div>
		</div>

	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<script type="text/javascript">
	function select(val) {
		location.href="/recruit/recruit.do?curPage=${paging.curPage }&order=" + val;
	}
</script>
<%@include file="../main/footer.jsp"%>