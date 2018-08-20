<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
	<h1>
		<span class="fas fa-address-card fa-fw mr-1"></span>회원정보수정
	</h1>
	<div class="row justify-content-center">
		<div class="col-lg-6 col-11 my-3">
			<form>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="Email">이메일</label>
					<div class="col-sm-3">han92866@naver.com</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNickname">닉네임</label>
					<div class="col-sm-4">
						<input class="form-control" id="inputNickname" type="text" placeholder="닉네임">
						<small id="inputNickname" class="text-muted">1 ~ 8자 이상</small> 
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="Grade">등급</label>
					<div class="col-sm-6">관리자</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="Joindate">가입일</label>
					<div class="col-sm-3">2018-08-01</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-7">
						<input class="form-control" id="inputPassword" type="password" placeholder="비밀번호"> 
						<small id="inputPassword" class="text-muted">숫자, 특수문자 포함 8자 이상</small>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
						확인</label>
					<div class="col-sm-7">
						<input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인"> 
						<small id="inputPasswordCheck" class="text-muted">비밀번호를 한번 더 입력해주세요.</small>
					</div>
				</div>
			</form>
		</div>
		
		<div class="col-md-4 col-8 ">
			<img class="img-thumbnail img-fluid rounded float-left mb-3"
				src="../img/m2.jpg">
			<div class="text-center">
				<button type="button" class="btn btn-secondary btn-sm">사진선택</button>
			</div>
		</div>
	</div>
	<div>
		<div class="col-sm-12 text-center">
			<button class="btn btn-primary mt-3" type="submit">
				수정완료<i class="fa fa-check spaceLeft"></i>
			</button>
		</div>
	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>