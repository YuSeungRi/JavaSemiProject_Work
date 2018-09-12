<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../main/header.jsp"%>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp"%>

<div class="container m-3">
	<h1>
		<span class="fas fa-address-card fa-fw mr-1"></span>마이페이지
	</h1>
	<div class="row justify-content-center">
		<div class="col-lg-6 col-11 my-3">
		<form>
			<table width="500px" cellpadding="7" class="table table-sm">
				<tr>
					<td>이메일</td>
					<td>${sessionScope.userId }</td>
				</tr>

				<tr>
					<td>닉네임</td>
					<td>${sessionScope.userNick }</td>
				</tr>

				<tr>
					<td>등급</td>
					<td>${requestScope.userinfo.userLevel }</td>
				</tr>

				<tr>
					<td>가입일</td>
					<td>${requestScope.userinfo.userRegistDate }</td>
				</tr>

				<tr>
					<td>자기소개</td>
					<td><textarea cols="45" rows="4"
							style="background-color: white; width: 100%; border: 0; resize: none;"
							disabled>${requestScope.userinfo.userIntro }</textarea></td>
				</tr>
			</table>
			</form>
			<hr>

		</div>
		<div class="col-md-3 col-8 ">
			<img class ="img-thumbnail img-fluid rounded float-left mb-3"
 						src="/upload/${sessionScope.userPhoto }" id='img-upload' style="width:250px; height:300px;" />
		</div>
	</div>
	<div>
		<div class="col-sm-12 text-center">
			<a href="#">
				<button class="btn btn-primary mt-3" type="button"
					data-toggle="modal" data-target="#pwd">회원정보수정</button>
			</a>

			<div class="modal fade" id="pwd" tabindex="-1" role="dialog"
				aria-labelledby="signInTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="signInTitle">비밀번호 확인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<form action="/mypage/mypage.do" method="post">
									<div class="form-group text-left">
										<label for="password">패스워드</label> 
										<input type="password" class="form-control" name="userConfirmPwd"
											placeholder="패스워드를 입력해주세요." required>
										<small id="passwordHelp" class="form-text text-muted">패스워드는
											6자 이상에 영어대소문자, 숫자를 포함해서 입력해주세요.</small>
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
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.boardCategory }</td>
							<td><a href="/Freeboard/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<td>${board.boardCreate }</td>
						</tr>
					</c:forEach>
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
						<th>댓글</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${replyList }" var="reply">
						<tr>
							<td>${reply.boardCategory }</td>
							<td><a href="/Freeboard/detail.do?boardno=${reply.boardNo }">${reply.boardTitle }</a>
							<td>${reply.replyContent }</td>
							<td>${reply.replyCreate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@include file="../main/scriptloader.jsp"%>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
<%@include file="../main/footer.jsp"%>