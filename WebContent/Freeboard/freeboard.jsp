<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
	<h1>
		<span class="fa fa-sign-in-alt fa-fw mr-1"></span>자유게시판
	</h1>
	<div class="col mt-1">
		<div class="col-mt-11 table-responsive">
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
						<tr>
							<td>1</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
						<tr>
							<td>2</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
						<tr>
							<td>3</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
						<tr>
							<td>4</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
						<tr>
							<td>5</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
						<tr>
							<td>6</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
						<tr>
							<td>7</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
						<tr>
							<td>8</td>
							<td>2018-08-02</td>
							<td>놀러갑시다</td>
							<td>관리자</td>
							<td>1234</td>
							<td>321</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br> <a href="#" class="btn btn-secondary btn-sm active"
				role="button" aria-pressed="true">작성</a> <br> <br>

			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">&laquo</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">&raquo</a></li>
			</ul>

		</div>

	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>