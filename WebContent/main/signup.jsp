<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// TODO: login 체크
	boolean isLoggedIn = false;
%>
<div class="d-flex flex-row w-100 justify-content-center ">
<%
	if(session.getAttribute("login") != null) {
%>
	<a href="/mypage/mypage.do">
	<button type="button" class="btn btn-sm bg-secondary text-light mr-1"><span class="fa fa-user fa-fw mr-1"></span><span class="menu-collapsed">정보수정</span></button>
	</a>
	<button type="button" class="btn btn-sm bg-secondary text-light" ><span class="fa fa-sign-out-alt fa-fw mr-1"></span><span class="menu-collapsed">로그아웃</span></button>
<% } else {%>
<!-- Button trigger modal -->

	<a href="/main/signin.do">
	<button type="button" class="btn btn-sm bg-success text-light mr-1" ><span class="fa fa-sign-in-alt fa-fw mr-1"></span><span class="menu-collapsed">로그인</span></button>
	</a>
	
	<a href="#">
	<button type="button" class="btn btn-sm bg-secondary text-light" data-toggle="modal" data-target="#signIn"><span class="fa fa-user-plus fa-fw mr-1"></span><span class="menu-collapsed">회원가입</span></button>
	</a>

<!-- Modal -->
<div class="modal fade" id="signIn" tabindex="-1" role="dialog" aria-labelledby="signInTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="signInTitle">회원가입</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<form>
						<div class="form-group">
							<label for="nickname">닉네임</label>
							<input type="text" class="form-control" id="nickname" aria-describedby="nicknameHelp" placeholder="닉네임을 입력해주세요.">
							<small id="nicknameHelp" class="form-text text-muted">닉네임은 2~10자 이내로 입력해주세요.</small>
						</div>
						<div class="form-group">
							<label for="email">이메일</label>
							<input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요.">
						</div>
						<div class="form-group">
							<label for="password">패스워드</label>
							<input type="password" class="form-control" id="password" placeholder="패스워드를 입력해주세요.">
							<small id="passwordHelp" class="form-text text-muted">패스워드는 6자 이상에 영어대소문자, 숫자를 포함해서 입력해주세요.</small>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="passwordChecker">
							<label class="form-check-label" for="passwordChecker">패스워드 보기</label>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">회원가입</button>
			</div>
		</div>
	</div>
</div>
<%
}
%>
</div>