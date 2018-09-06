<%@include file="./scriptloader.jsp" %>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
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
			<form action="/main/signin.do" method="post">
				<div class="form-group">
					<label for="idInput">Email address</label>
					<input type="email" class="form-control" name="userEmail" placeholder="아이디를 입력하세요.">
				</div>
				<div class="form-group">
					<label for="passwordInput">Password</label> <input type="password"
						class="form-control" name="userPw" id="my-password"
						placeholder="패스워드를 입력해주세요." >

				</div>
				<button type="submit" class="btn btn-primary btn-sm">로그인</button>
				<button type="button" class="btn btn-primary btn-sm"
					data-toggle="modal" data-target="#pwdsearch">패스워드찾기</button>

			</form>
			
			
			<!-- Modal -->
			<div class="modal fade" id="pwdsearch" tabindex="-1" role="dialog"
				aria-labelledby="signInTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="signInTitle">비밀번호 찾기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<form action="/main/sendMail.jsp" method="post">
									<div class="form-group">
										<label for="email">이메일</label> 
										<input type="email" class="form-control" name="to" placeholder="이메일을 입력해주세요.">
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">확인</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- Button trigger modal -->
				</div>
			</div>
			
			
		</div>
		<div class="col-lg-6 col-12">
			<h5> 소셜 로그인 </h5>
			
			<div class="m-3">
				<%@ include file="./naverlogin.jsp" %>
			</div>
			<div class="m-3">
				<%@ include file="./googlelogin.jsp" %>
			</div>
		</div>
		
	</div>
</div>
<%@include file="./scriptloader.jsp" %>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
<%@include file="./footer.jsp" %>