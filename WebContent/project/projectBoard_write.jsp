<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">

	<h2><i class="fa fa-project-diagram fa-fw mr-1"></i>프로젝트 등록하기</h2>

<form action="/project/projectWrite.do" method="post">	
	  <div class="form-group row mt-5">
	    <label for="title" class="col-sm-2 col-form-label">프로젝트 명</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="title" name="title" placeholder="프로젝트명을 입력하세요">
	    </div>
	  </div>	  
	  	  
	  <div class="form-group row">
	    <div class="col-sm-2">지역</div>
	    <div class="col-sm-10">
	 	<select class="custom-select" name="location">
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
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="checkbox" value="1">
			  <label class="form-check-label" for="inlineCheckbox1">java</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="checkbox" value="2">
			  <label class="form-check-label" for="inlineCheckbox2">C++</label>
			</div>
				      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" name="checkbox" value="3">
			  <label class="form-check-label" for="inlineCheckbox3">C#</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" name="checkbox" value="4">
			  <label class="form-check-label" for="inlineCheckbox4">javaScript</label>
			</div>
				      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" name="checkbox" value="5">
			  <label class="form-check-label" for="inlineCheckbox5">CSS</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" name="checkbox" value="6">
			  <label class="form-check-label" for="inlineCheckbox6">HTML</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" name="checkbox" value="7">
			  <label class="form-check-label" for="inlineCheckbox7">Node.js</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox8" name="checkbox" value="8">
			  <label class="form-check-label" for="inlineCheckbox8">Oracle</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox9" name="checkbox" value="9">
			  <label class="form-check-label" for="inlineCheckbox9">MySQL</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox10" name="checkbox" value="10">
			  <label class="form-check-label" for="inlineCheckbox10">JSP</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox11" name="checkbox" value="11">
			  <label class="form-check-label" for="inlineCheckbox11">Python</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox12" name="checkbox" value="12">
			  <label class="form-check-label" for="inlineCheckbox12">PHP</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox13" name="checkbox" value="13">
			  <label class="form-check-label" for="inlineCheckbox13">Ruby</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox14" name="checkbox" value="14">
			  <label class="form-check-label" for="inlineCheckbox14">Angular.js</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox15" name="checkbox" value="15">
			  <label class="form-check-label" for="inlineCheckbox15">react</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox16" name="checkbox" value="16">
			  <label class="form-check-label" for="inlineCheckbox16">vue.js</label>
			</div>
			
			
	    </div>
	  </div>
		
	  <div class="form-group row">
	    <div class="col-sm-2">기간</div>
		  
			<div class="form-group col-md-5">
			 <label >시작일</label>
			 <input type="date" name="startday" max="3000-12-31" 
			        min="1000-01-01" class="form-control">
			</div>
			
			<div class="form-group col-md-5">
			 <label >종료일</label>
			 <input type="date" name="endday" min="1000-01-01"
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