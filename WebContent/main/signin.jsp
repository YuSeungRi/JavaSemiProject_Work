<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<%@include file="./styleloader.jsp" %>
<div class="container m-2">
	<h1><span class="fa fa-sign-in-alt fa-fw mr-1"></span>로그인</h1>
	<div class="row justify-content-center">
		<div class="col-lg-5 col-11 my-3"> 
			<h5>일반 로그인</h5>
			<form>
				<div class="form-group">
					<label for="idInput">Email address</label>
					<input type="email" class="form-control" id="userId" placeholder="아이디를 입력하세요.">
				</div>
				<div class="form-group">
					<label for="passwordInput">Password</label>
					<input type="password" class="form-control" id="userPw" placeholder="Password">
				</div>
				<button type="submit" class="btn btn-primary btn-sm">로그인</button>
				<button type="button" class="btn btn-primary btn-sm">아이디찾기</button>
				<button type="button" class="btn btn-primary btn-sm">패스워드찾기</button>
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
<%@include file="./scriptloader.jsp" %>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
<%@include file="./footer.jsp" %>