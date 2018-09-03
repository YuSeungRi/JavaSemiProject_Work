<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../main/header.jsp"%>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />
<%@include file="../main/styleloader.jsp"%>
<%-- 작성일 : 2018.09.03 / 작성자 : 권미현 / 구인구직 수정 --%>
<div class="container m-3">
	<h2>
		<i class="fas fa-pencil-alt fa-2x"></i>구인구직 수정
	</h2>


	<form action="/recruit/update.do" method="post">
	<input type="hidden" name="boardno" value="${board.boardNo }" />
		<div class="form-group row">
			<%-- 제목 라벨 --%>
			<label for="title" class="col-sm-2 col-form-label">제목</label>
			<%-- 제목 입력 영역 --%>
			<input type="text" id="title" name="title" 
			class="form-control col-sm-7" value="${board.boardTitle }"/>
			
			<!-- 구인구직 선택 -->
			
			<div class="col-sm-3">
				<select name="status" class="custom-select">
					<option value="jobOffer" <c:if test="${board.recruitStatus eq '구인'}">selected="selected"</c:if>>구인</option>
					<option value="jobOfferComplete" <c:if test="${board.recruitStatus eq '구인완료'}">selected="selected"</c:if>>구인완료</option>
					<option value="jobHunt" <c:if test="${board.recruitStatus eq '구직'}">selected="selected"</c:if>>구직</option>
					<option value="jobHuntComplete" <c:if test="${board.recruitStatus eq '구직완료'}">selected="selected"</c:if>>구직완료</option>
				</select>
			</div>
		</div>



		<%-- 내용 --%>
		<%-- summernote_start --%>
		<textarea id="summernote" name="content" class="form-control">${board.boardContent }</textarea>
		<%-- summernote_end --%>


		<%-- 파일 첨부 --%>
		<div class="form-group row mt-4">
			<label for="file" class="col-sm-3 col-form-label">파일 첨부</label>
			<div class="col-sm-7">
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="file">
					 <label class="custom-file-label" for="file"></label>
				</div>
			</div>
		</div>


		<%-- 버튼 --%>
		<div class="row justify-content-center">
			<button id="btnUpdate" class="btn btn-primary mr-3">수정</button>
			<button id="btnCancel" class="btn btn-danger">취소</button>
		</div>
	</form>
</div>
<%@include file="../main/scriptloader.jsp"%>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
<script type="text/javascript" src="../summernote/summernote-bs4.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500
		// 높이 500 지정
		});
		$("#btnUpdate").click(function() {
			$("form").submit();	
		});
		$("#btnCancel").click(function() {
			history.go(-1);
		});
	});
</script>
<%@include file="../main/footer.jsp"%>