<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<table class="col-md-10 table table-hover table-sm">
						<thead class="thead-light">
							<tr>
								<th>제목:</th>
								<th>첫번 째 글 입니다</th>
								<th></th>
								<th></th>
								<th></th>				
								<th><i class="far fa-thumbs-up fa-sm"></i></th>
							</tr>
						</thead>
					</table>
					<div class="col-md-10">
						<article>
						<p>
						첫번째 글은 내가 먹었으므로 우리 주변에는 규모를 가늠할 수 없을 정도로 많은 정보와 데이터를 합산하여
						</p>
						<p>
						말과 행동이 완전한 인간이 되어라 입으로는 훌륭한 것을 말하되 행동은 영예롭게 하라 전자는 두뇌의 완성을
						후자는 마음의 완성을 드러낸다
						둘다 고상한 정신에서 나온다
						말은 행동의 그림자이다
						</p>
						<br>
						<br>
						<br>
						<br>
						</article>
					</div>
				</div>
				<div class="row justify-content-end">
					<a href="#" class="btn btn-secondary btn-sm active"
					role="button" aria-pressed="true">작성</a>
						
					<a href="#" class="btn btn-secondary btn-sm active"
					role="button" aria-pressed="true">수정</a>
					
					<a href="#" class="btn btn-secondary btn-sm active"
					role="button" aria-pressed="true">삭제</a>
				</div>
			</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>