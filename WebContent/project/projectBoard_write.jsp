<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">

	<h2><i class="fa fa-project-diagram fa-fw mr-1"></i>프로젝트 등록하기</h2>

<form action="/project/projectWrite.do" method="post">
	
	  <div class="form-group row mt-5">
	    <label for="projectName" class="col-sm-2 col-form-label">프로젝트 명</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="projectName" placeholder="프로젝트명을 입력하세요">
	    </div>
	  </div>	  
	  	  
	  <div class="form-group row">
	    <div class="col-sm-2">지역</div>
	    <div class="col-sm-10">
	 	<select class="custom-select">
		  <option selected>지역을 선택하세요</option>
			<option value="1" >서울</option>											
			<option value="2" >부산</option>											
			<option value="3" >대구</option>											
			<option value="4" >인천</option>											
			<option value="5" >광주</option>											
			<option value="6" >대전</option>											
			<option value="7" >울산</option>											
			<option value="8" >세종</option>											
			<option value="9" >경기</option>											
			<option value="10" >강원</option>											
			<option value="11" >충청</option>											
			<option value="13" >전라</option>											
			<option value="14" >경상</option>	
			<option value="15" >제주</option>
		</select>
	    </div>
	  </div>	  

	  <div class="form-group row">
	    <div class="col-sm-2">사용기술</div>
	    <div class="col-sm-10">
	      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
			  <label class="form-check-label" for="inlineCheckbox1">java</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
			  <label class="form-check-label" for="inlineCheckbox2">C++</label>
			</div>
				      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
			  <label class="form-check-label" for="inlineCheckbox3">C#</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
			  <label class="form-check-label" for="inlineCheckbox4">javaScript</label>
			</div>
				      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
			  <label class="form-check-label" for="inlineCheckbox5">CSS</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
			  <label class="form-check-label" for="inlineCheckbox6">HTML</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
			  <label class="form-check-label" for="inlineCheckbox7">Node.js</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option8">
			  <label class="form-check-label" for="inlineCheckbox8">Oracle</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option9">
			  <label class="form-check-label" for="inlineCheckbox9">MySQL</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option10">
			  <label class="form-check-label" for="inlineCheckbox10">JSP</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option11">
			  <label class="form-check-label" for="inlineCheckbox11">Python</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option12">
			  <label class="form-check-label" for="inlineCheckbox12">PHP</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option13">
			  <label class="form-check-label" for="inlineCheckbox13">Ruby</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox14" value="option14">
			  <label class="form-check-label" for="inlineCheckbox14">Angular.js</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox15" value="option15">
			  <label class="form-check-label" for="inlineCheckbox15">react</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox16" value="option16">
			  <label class="form-check-label" for="inlineCheckbox16">vue.js</label>
			</div>
			
			
	    </div>
	  </div>
		
	  <div class="form-group row">
	    <div class="col-sm-2">기간</div>
		  
			<div class="form-group col-md-5">
			 <label >시작일</label>
			 <input type="date" name="bday" max="3000-12-31" 
			        min="1000-01-01" class="form-control">
			</div>
			
			<div class="form-group col-md-5">
			 <label >종료일</label>
			 <input type="date" name="bday" min="1000-01-01"
			        max="3000-12-31" class="form-control">
			</div>

	  </div>
	  
		<%-- 내용 --%>
		<%-- summernote_start --%>
		<textarea id="summernote" name="summernote"></textarea>
		
		<br>
		<%-- summernote_end --%>	  	

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
	// 버튼 이벤트
	$(document).ready(function(){
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

	});
</script>


<script type="text/javascript">
    	$(document).ready(function() {
      		$('#summernote').summernote({
      			height : 300 // 높이 300 지정
      		});
    	});
</script>

<%@include file="../main/footer.jsp" %>