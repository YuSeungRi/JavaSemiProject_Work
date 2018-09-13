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
					<label class="col-form-label col-sm">총 회원수 : ${requestScope.totalCount}</label>
					<label class="col-form-label col-sm">검색된 회원수 : ${requestScope.totalSearchCount}</label>
				</div>
				
				<form action="/admin/userinfoadminsearch.do" name="search" method="get">
					<div>
						<div
							class="input-group input-group-sm col-12 offset-sm-8 col-sm-4">
							<select name="keyFiled" size="1">
								<option value="userEmail"
									<c:if test="${'userEmail'==keyFiled }"> selected</c:if>>이메일</option>
								<option value="userNick"
									<c:if test="${'userNick'==keyFiled }"> selected</c:if>>닉네임</option>
							</select> 
							<input type="text" class="text-sm form-control" placeholder="내용을입력하세요" name="searchString" required>
							<div class="input-group-append">
								<button class="btn btn-success" type="submit">검색</button>
							</div>
						</div>
					</div>
				</form>


			<div style="overflow: auto;" class="mt-3">
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
						<c:forEach items="${UserSearchList }" var="UserSearch">
							<tr>
								<td>${UserSearch.userEmail }</td>
								<td>${UserSearch.userNick }</td>
								<td>${UserSearch.userLevel }</td>
								<td>${UserSearch.cntboard }</td>
								<td>${UserSearch.cntreply }</td>
								<td>${UserSearch.userRegistDate }</td>
								<td>${UserSearch.logintime }</td>
								<td>
									<form action="/admin/userinfoadminsearch.do" method="get">
										<select onchange="this.form.submit()" name="level" class="custom-select">
											<option value="1" <c:if test="${'1'==level}">selected</c:if>>${UserSearch.userLevel }</option>
											<option value="1" <c:if test="${'1'==level}">selected</c:if>>1</option>
											<option value="2" <c:if test="${'2'==level}">selected</c:if>>2</option>
											<option value="3" <c:if test="${'3'==level}">selected</c:if>>3</option>
											<option value="4" <c:if test="${'4'==level}">selected</c:if>>4</option>
											<option value="5" <c:if test="${'5'==level}">selected</c:if>>5</option>
											<option value="6" <c:if test="${'6'==level}">selected</c:if>>6</option>
											<option value="7" <c:if test="${'7'==level}">selected</c:if>>7</option>
											<option value="8" <c:if test="${'8'==level}">selected</c:if>>8</option>
											<option value="9" <c:if test="${'9'==level}">selected</c:if>>9</option>
										</select>
										<input type="hidden" name="email" value="${UserSearch.userEmail }">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="row justify-content-center">
				<div class="col m-4">
					<%-- 페이지네이션 --%>
					<jsp:include page="/util/userinfosearchPaging.jsp" />
				</div>
			</div>
		</div>

	</div>

</div>
<%@include file="../main/scriptloader.jsp"%>
<%@include file="../main/footer.jsp"%>