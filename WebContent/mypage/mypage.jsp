<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<div class="container m-3">
	<h1>
		<span class="fas fa-address-card fa-fw mr-1"></span>마이페이지
	</h1>
	<div class="row justify-content-center">
		<div class="col-lg-6 col-11 my-3">
			<form>
				<div class="form-group form-inline">
					<label class="col-sm-3 control-label" for="Email">이메일 :</label>
					<div class="col-sm-3">han92866@naver.com</div>
				</div>

				<div class="form-group form-inline">
					<label class="col-sm-3 control-label" for="inputNickname">닉네임
						:</label>
					<div class="col-sm-4">홍길동</div>
				</div>

				<div class="form-group form-inline">
					<label class="col-sm-3 control-label" for="Grade">등급 :</label>
					<div class="col-sm-6">관리자</div>
				</div>

				<div class="form-group form-inline">
					<label class="col-sm-3 control-label" for="Joindate">가입일 :</label>
					<div class="col-sm-3">2018-08-01</div>
				</div>

				<div class="form-group form-inline">
					<label class="col-sm-3 control-label" for="inputPassword">최근접속일
						: </label>
					<div class="col-sm-7">2018-08-15</div>
				</div>

				<div class="form-group form-inline">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">접속횟수
						: </label>
					<div class="col-sm-7">100회</div>
				</div>
			</form>
		</div>
		<div class="col-md-3 col-8 ">
			<img class="img-thumbnail img-fluid rounded float-left mb-3"
				src="../img/m2.jpg">
		</div>
	</div>
	<div>
		<div class="col-sm-12 text-center">
			<button class="btn btn-primary mt-3" type="submit">회원정보수정</button>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-lg-6 col-12 my-3">
			<h5>내가 쓴 게시판</h5>
			<table class="table table-hover table-sm">
				<thead class="thead-light">
					<tr>
						<th>게시판 종류</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="col-lg-6 col-12 my-3">
			<h5>내가 쓴 댓글</h5>
			<table class="table table-hover table-sm">
				<thead class="thead-light">
					<tr>
						<th>게시판 종류</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
					<tr>
						<td>자유게시판</td>
						<td>덥다더워</td>
						<td>2018-08-02</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@include file="../main/footer.jsp"%>