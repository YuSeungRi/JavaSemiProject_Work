<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
게시글 작성
작성일 : 2018.08.15
작성자 : 권미현
 --%>
<%@include file="../main/header.jsp" %>
<div class="container m-3">

	<h2><i class="fas fa-pencil-alt fa-2x"></i>게시글 작성</h2>
	
	
	<%-- 제목 --%>
	<form>
 		<div class="form-group row">
    		<label for="title" class="col-sm-2 col-form-label">제목</label>
    		<div class="col-sm-10">
    			<input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요.">
    		</div>
 		</div>
	</form>
	
	
	<%-- 내용 --%>
	<%-- summernote_start --%>
	<%-- summernote 적용 안 됨. → summernote 함수를 못 찾음. --%>
	<script type="text/javascript">
    	$(document).ready(function() {
      		$('#summernote').summernote();
    	});
  	</script>
  	<div id="summernote">Test Summernote</div>
  	<%-- summernote_end --%>
  	
  	
  	<%-- 파일 첨부 --%>
  	<div class="form-group row">
  		<label for="file" class="col-sm-3 col-form-label">파일 첨부</label>
    	<div class="col-sm-7">
  			<div class="custom-file">
    			<input type="file" class="custom-file-input" id="file">
  				<label class="custom-file-label" for="file"></label>
    		</div>
		</div>
	</div>
	
	
	<%-- 버튼 --%>
	<div class="row justify-content-around">
		<button class="btn btn-secondary">초기화</button>
		<button class="btn btn-secondary">목록으로</button>
		<button class="btn btn-primary" >등록</button>
	</div>
	
</div>
<%@include file="../main/footer.jsp" %>