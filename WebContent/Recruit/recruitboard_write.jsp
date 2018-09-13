<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
게시글 작성
작성일 : 2018.08.30
작성자 : 권미현

구인구직_작성 페이지
 --%>
<%@include file="../main/header.jsp" %>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">

<%if(session.getAttribute("userId") == null) { %>
	<script type="text/javascript">
		alert("로그인 상태여야 사용 가능합니다.")
		location.href = "/main/signin.do";
	</script>
<%} %>
	<h2><i class="fas fa-pencil-alt fa-2x"></i>구인구직 작성</h2>
	
	
	<form action="/recruit/write.do" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<%-- 제목 라벨 --%>
			<label for="title" class="col-sm-2 col-form-label">제목</label>
			<%-- 제목 입력 영역 --%>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="제목을 입력해주세요.">
			</div>
			
			<!-- 구인구직 선택 -->
			<div class="col-sm-3">
				<select name="status" class="custom-select">
					<option value="jobOffer">구인</option>
<!-- 					<option value="jobOfferComplete">구인완료</option> -->
					<option value="jobHunt">구직</option>
<!-- 					<option value="jobHuntComplete">구직완료</option> -->
				</select>
			</div>
		</div>


		<%-- 내용 --%>
		<%-- summernote_start --%>
		<textarea id="summernote" name="summernote"></textarea>
		
		<br>
		<%-- summernote_end --%>


		<%-- 파일 첨부 --%>
		<div class="form-group row">
			<label for="file" class="col-sm-3 col-form-label">파일 첨부</label>
			<div class="col-sm-7">
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="file" name="file" />
					<label class="custom-file-label" for="file"></label>
				</div>
			</div>
		</div>


		<%-- 버튼 --%>
		<div class="row justify-content-around">
			<button id="btnReset" type="reset" class="btn btn-secondary">초기화</button>
			<button id="btnBefore" type="button" class="btn btn-secondary">목록으로</button>
			<button id="btnWrite" class="btn btn-primary">등록</button>
		</div>
	</form>
	
</div>
<%@include file="../main/scriptloader.jsp" %>
<%-- 여기에 페이지에 사용할 js를 삽입하세요. --%>
<script type="text/javascript" src="../summernote/summernote-bs4.js" ></script>

<script type="text/javascript">
	$(document).ready(function(){
		// 버튼 이벤트
		$("#btnBefore").click(function(){
			history.back(); // 이전 화면으로 넘어가기
		});
		
		$("#btnReset").click(function(){
			$("#summernote").summernote("reset");
		});

		$("#btnWrite").click(function(){
			$("#summernote").summernote("code");
			$("form").submit();
		});
		
		// 파일첨부 기능 추가 (수정일 : 2018.09.04 / 수정자 : 권미현)
		$('.custom-file-input').on('change', function() { 
			   var fileName = $(this).val().split('\\').pop(); 
			   $(this).next('.custom-file-label').addClass("selected").html(fileName); 
		});
		
		$('#summernote').summernote({
  			height : 500 // 높이 500 지정
  		});
	});
</script>
<%@include file="../main/footer.jsp" %>