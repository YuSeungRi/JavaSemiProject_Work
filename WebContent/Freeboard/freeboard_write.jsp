<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
게시글 작성
작성일 : 2018.08.15
작성자 : 권미현

수정일 : 2018.08.27
수정자 : 권미현
	버튼 기능 연결 (아직 하는 중)
 --%>
<%@include file="../main/header.jsp" %>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">

	<h2><i class="fas fa-pencil-alt fa-2x"></i>게시글 작성</h2>
	
	
	<%-- 제목 --%>
	<form action="/Freeboard/free_write.do" method="post">
		<div class="form-group row">
			<label for="title" class="col-sm-2 col-form-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="title"
					placeholder="제목을 입력해주세요.">
			</div>
		</div>


		<%-- 내용 --%>
		<%-- summernote_start --%>
		<div id="summernote"></div>
		<br>
		<%-- summernote_end --%>


		<%-- 파일 첨부 --%>
		<div class="form-group row">
			<label for="file" class="col-sm-3 col-form-label">파일 첨부</label>
			<div class="col-sm-7">
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="file"> <label
						class="custom-file-label" for="file"></label>
				</div>
			</div>
		</div>


		<%-- 버튼 --%>
		<div class="row justify-content-around">
			<button id="btnReset" class="btn btn-secondary">초기화</button>
			<button id="btnBefore" class="btn btn-secondary">목록으로</button>
			<button id="btnWrite" class="btn btn-primary">등록</button>
		</div>
	</form>
	
</div>
<%@include file="../main/scriptloader.jsp" %>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
<script type="text/javascript" src="../summernote/summernote-bs4.js" ></script>
<script type="text/javascript">
    	$(document).ready(function() {
      		$('#summernote').summernote({
      			height : 500 // 높이 500 지정
      		});
    	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#btnReset").click(function(){
			console.log("초기화");
			$("#title").text("");
			$("#summernote").text("");
		});
		
		$("#btnBefore").click(function(){
			history.go(-1); // 이전 화면으로 넘어가기
			console.log("목록으로");
		});
		
		$("#btnWrite").click(function(){
			console.log("등록");
			$("form").submit();
		});
	});
</script>
<%@include file="../main/footer.jsp" %>