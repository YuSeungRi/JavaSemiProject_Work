<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../main/header.jsp"%>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp"%>
<div class="container m-3">
	<h1>
		<span class="fa fa-sign-in-alt fa-fw mr-1"></span>회원관리
	</h1>
	<div class="col mt-1">
		<div class="col-mt-11">

			<div>
			
				<div>
					<label class="col-form-label col-sm">총 회원수 : </label>
				</div>
				<div>
					<label class="col-form-label col-sm">금일 가입자수 : </label>
				</div>
				

				<form>
					<div class="form-inline my-2 justify-content-end">
						<div class="form-group mx-1">
							<label class="col-form-label">검색</label>
						</div>
						<div class="form-group mx-1">
							<select onchange="select(this.value)" name="status"
								class="custom-select">
								<option value="useremail"
									<c:if test="${order eq 'jobOfferComplete'}">selected="selected"</c:if>>이메일</option>
								<option value="usernick"
									<c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>닉네임</option>
							</select>
						</div>
						<div class="form-group mx-1">
							<input type="text" name="title" class="form-control" placeholder="입력해주세요." />
						</div>
						<div class="form-group mx-1">
							<button class="btn btn-primary" type="submit">검색</button>
						</div>
					</div>
				</form>

			</div>


			<div style="overflow: auto;" class="">
				<table class="table table-hover table-sm" style="margin:auto; text-align:center;">
					<thead class="thead-light">
						<tr>
							<th>이메일</th>
							<th>닉네임</th>
							<th>등급</th>
							<th>게시판 작성수</th>
							<th>댓글 작성수</th>
							<th>가입일자</th>
							<th>최근로그인</th>
							<th>등급설정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${UserList }" var="User">
							<tr>
								<td>${User.userEmail }</td>
								<td>${User.userNick }</td>
								<td>${User.userLevel }</td>
								<td>${User.cntboard }</td>
								<td>${User.cntreply }</td>
								<td>${User.userRegistDate }</td>
								<td>${User.logintime }</td>
								<td>
									<select onchange="select(this.value)" name="status" class="custom-select">
										<option value="useremail" <c:if test="${order eq 'jobOfferComplete'}">selected="selected"</c:if>>${User.userLevel }</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>1</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>2</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>3</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>4</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>5</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>6</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>7</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>8</option>
										<option value="usernick" <c:if test="${order eq 'jobHunt'}">selected="selected"</c:if>>9</option>
									</select>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row justify-content-center">
				<div class="col m-4">
					<%-- 페이지네이션 --%>
					<jsp:include page="/util/userinfoPaging.jsp" />
				</div>
			</div>
		</div>

	</div>

</div>
<%@include file="../main/scriptloader.jsp"%>
<%@include file="../main/footer.jsp"%>