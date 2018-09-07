<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex flex-row w-100 justify-content-center ">

	<%--login success --%>
	<c:if test="${sessionScope.login eq true }" >
		<a href="/mypage/mypage.do">
		<button type="button" class="btn btn-sm bg-secondary text-light mr-1"><span class="fa fa-user fa-fw mr-1"></span><span class="menu-collapsed">마이페이지</span></button>
		</a>
		<a href="/user/logout.do">
		<button type="button" class="btn btn-sm bg-secondary text-light"><span class="fa fa-sign-out-alt fa-fw mr-1"></span><span class="menu-collapsed">로그아웃</span></button>
		</a>
	</c:if>
	
	<%-- login fail --%>
	<c:if test="${sessionScope.login ne true }">
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
							<form name="userInfoForm" onsubmit="return post_check();" action="/main/signup.do" 
							method="post" id="content_pwd">
								<div class="form-group">
									<label for="nickname">닉네임</label>
									<input type="text" class="form-control" name="userNick" aria-describedby="nicknameHelp" 
									placeholder="닉네임을 입력해주세요." pattern="(?=.*[가-힣a-zA-Z]).{2,}"  title="닉네임은 2글자 이상 입력해주세요." required>
									<small id="nicknameHelp" class="form-text text-muted">닉네임은 2~10자 이내로 입력해주세요.</small>
								</div>
								<div class="form-group">
									<label for="email">이메일</label>
									<input type="email" class="form-control" name="userEmail" placeholder="이메일을 입력해주세요.">
								</div>
								<div class="form-group">
									<label for="password">패스워드</label>
									<input type="password" class="form-control" name="userPw" id="my-password"
									 placeholder="패스워드를 입력해주세요." pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
									 title="패스워드는 6자 이상에 영어대소문자, 숫자를 포함해서 입력해주세요." required>
									<small id="passwordHelp" class="form-text text-muted">패스워드는 6자 이상에 영어대소문자, 숫자를 포함해서 입력해주세요.</small>
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input" id="passwordChecker">
									<label class="form-check-label" for="passwordChecker">패스워드 보기</label>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div><!-- Button trigger modal -->
			</div>
		</div>
	</c:if>
</div>
