<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
<div class="container m-3">
	<h1><span class="fa fa-sign-in-alt fa-fw mr-1"></span>로그인</h1>
	<div class="row justify-content-center">
		<div class="col-lg-5 col-11 my-3"> 
			<form>
				<h5>일반 로그인</h5>
				<div class="form-group">
					<label for="idInput">Email address</label>
					<input type="email" class="form-control" id="idInput" placeholder="아이디를 입력하세요.">
				</div>
				<div class="form-group">
					<label for="passwordInput">Password</label>
					<input type="password" class="form-control" id="passwordInput" placeholder="Password">
				</div>
				<button type="submit" class="btn btn-primary">로그인</button>
				<button type="button" class="btn btn-primary">아이디찾기</button>
				<button type="button" class="btn btn-primary">패스워드찾기</button>
			</form>
		</div>
		<div class="col-lg-6 col-12">
			<h5> 소셜 로그인 </h5>
			<div class="m-3">
				<button type="button" class="btn btn-warning btn-block">카카오 로그인</button>
			</div>
			<div class="m-3">
				<button type="button" class="btn btn-success btn-block">네이버 로그인</button>
			</div>
			<div class="m-3">
				<button type="button" class="btn btn-secondary btn-block">구글 로그인</button>
			</div>
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %>