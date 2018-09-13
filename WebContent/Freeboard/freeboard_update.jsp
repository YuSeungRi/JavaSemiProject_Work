<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
게시글 수정
작성일 : 2018.08.27
작성자 : 한상근
 --%>
<%@include file="../main/header.jsp"%>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />
<%@include file="../main/styleloader.jsp"%>
<div class="container m-3">
	<h2>
		<i class="fas fa-pencil-alt fa-2x"></i>게시글 수정
	</h2>

	<%-- 제목 --%>
	<form action="/Freeboard/update.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardno" value="${board.boardNo }" />
		<div class="form-group row">
			<label for="title" class="col-sm-2 col-form-label">제목</label>
			<input type="text" id="title" name="title" 
			class="form-control col-sm-10" value="${board.boardTitle }" required="required"/>
		</div>

		<%-- 내용 --%>
		<%-- summernote_start --%>
		<textarea id="summernote" name="summernote" class="form-control" required="required">${board.boardContent }</textarea>
		<%-- summernote_end --%>

		<%-- 업로드된 파일 --%>
		<div class="form-group row mt-4">
			<label for="uploadedFile" class="col-sm-3 col-form-label">저장된 파일</label>
			<ul class="list-group col-md-5 ">
			<c:if test="${fileList eq null }" >
				<li class="list-group-item"><span class="text-catuion">업로드한 파일이 없습니다.</span></li>
			</c:if>
			<c:if test="${fileList ne null }" >
			<c:forEach items="${fileList }" var="file" >
				<li class="list-group-item"><a href="/upload/${file.fileStoredName }" download>${file.fileName }</a>
				<button class="file" type="button" value="${file.fileNo }" >삭제</button></li>
			</c:forEach>
			</c:if>
			</ul>
		</div>
		
		<%-- 파일 첨부 --%>
		<div class="form-group row mt-4">
			<label for="file" class="col-sm-3 col-form-label">파일 첨부</label>
			<div class="col-sm-7">
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="file" name="file">
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
		$("#summernote").summernote("code");
		$("form").submit();	
	});
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	//file upload 파일 이름 업데이트
	$('.custom-file-input').on('change', function() { 
		   var fileName = $(this).val().split('\\').pop(); 
		   $(this).next('.custom-file-label').addClass("selected").html(fileName); 
	});
	
	//file 삭제
	$("button.file").click(function(){
		$a = $(this);
		$.ajax({
			type: "post"
			, url: "/file/delete.do"
			, dataType: "json"
			, data: {
				fileNo: $(this).val()
			}
			, success: function(data) {
				console.log("success");
				$a.parent().empty();
			}
			, error: function(e) {
				console.log("fail");
				console.log(e.responseText);
			}
		});
	});
		
});
</script>
<%@include file="../main/footer.jsp"%>