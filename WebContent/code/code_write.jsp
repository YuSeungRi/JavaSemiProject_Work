<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
code write page 
 --%>
<%@include file="../main/header.jsp" %>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../highlight/styles/default.css">
<%@include file="../main/styleloader.jsp" %>
<div class="container">
	<h1><span class="fa fa-sign-in-alt fa-fw mr-1"></span>Kit! 코드 작성</h1>
	<div class="row mt-3">
		<div class="col-11">
			<!-- source code uploader -->
			<div class="card">
				<form id="uploadForm" method="post">
					<div class="card-header">
						<h5 class="card-title">파일 업로드</h5>
					</div>
					<div class="card-body">
						<p class="card-text">여기에 소스코드 파일을 업로드 해주세요. 소스코드에는 @kit 태그를 꼭 넣어주세요!</p>
						<div class="row">
							<div class="col-md-5 form-group">
								<label for="codeCategory">Category</label>
								<select id="codeCategory" name="codeCategory" class="form-control">
									<c:forEach items="${categoryList }" var="category">
									<option value="${category.categoryNo }">${category.categoryName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-5 form-group">
								<label for="codeLanguage">Language</label>
								<select id="codeLanguage" name="codeLanguage" class="form-control">
									<option value="nohighlight">Default</option>
									<option value="Java">Java</option>
									<option value="C++">C++</option>
									<option value="C#">C#</option>
									<option value="javaScript">JavaScript</option>
									<option value="html">HTML</option>
									<option value="css">CSS</option>
									<option value="json">JSON</option>
									<option value="php">PHP</option>
									<option value="sql">SQL</option>
								</select>
							</div>
						</div>
						<div class="form-group">
								<label for="sourceFile">소스코드 파일</label>
								<input type="file" class="form-control-file" id="sourceFile" name="sourceFile" />
								<button id="btnFileRead" type="button" class="btn btn-warning">업로드</button>
						</div>
					</div><!--  end of card-body -->
<!-- 					<div class="card-body"> -->
<!-- 						<h6 class="card-text">적용 기술</h6> -->
<!-- 						<div id="techSelect" class="form-group form-check clearfix"> -->
<%-- 							<c:forEach items="${techList }" var="tech"> --%>
<!-- 								<div class="float-left m-2"> -->
<%-- 									<input type="checkbox" name="${tech.techNo }" value="${tech.techNo }" /> --%>
<%-- 									<label class="form-check-label" for="${tech.techNo }">${tech.techName }</label> --%>
<!-- 								</div> -->
<%-- 							</c:forEach> --%>
<!-- 						</div> end of form-check -->
<!-- 					</div>end of card-body -->
					<div class="card-footer">
						<button id="btnHelp" type="button" class="btn btn-warning">kit 사용법?</button>
						<button id="btnSubmit" class="btn btn-primary" >파싱 시작!</button>
					</div>
				</form>
			</div>
		</div> <!-- end of col -->
		<div class="col-11" id="uploadResult"></div>
	</div><!-- end of first row -->
	<div class="row my-3">
		<div id="progress" class="col-11 text-center hidden">
			<p> 소스를 까봤습니다...</p>
		</div>
	</div>
	<div class="row" id="parseList">
		
	</div><!-- end of row  -->
</div>
<%@include file="../main/scriptloader.jsp" %>
<%-- highlight.js --%>
<script src="../highlight/highlight.pack.js"></script>
<script type="text/javascript">
$("#progress").hide();

//preview for parsed code
var preview = function(){
	var codeText = $("#inputCode").val();
	var codeLanguage = $("#inputLanguage").val();
	$("#previewCode").addClass(codeLanguage);
	$("#previewCode").text(codeText);
	$("pre code").each(function(i, block){
		hljs.highlightBlock(block);
	});
};

var clickToggle = false;
var sourceFile;
var reader = new FileReader();
reader.onload = function(e) {
	sourceFile = reader.result;	
	$("#btnFileRead").attr("class", "btn btn-secondary");
	clickToggle = true;
}

$("#btnFileRead").on("click", function(){
	event.stopPropagation(); 
	event.preventDefault(); 
	reader.readAsText(document.getElementById("sourceFile").files[0],"UTF-8");
})


//Ajax for file parse 
$("#btnSubmit").on("click", function() {
	event.stopPropagation(); 
	event.preventDefault(); 
    
	if(!clickToggle) {
		alert("업로드 버튼을 먼저 눌러주세요.");
		return;
	}
	
    var codeCategory = document.getElementById("codeCategory").value;
    var codeLanguage = document.getElementById("codeLanguage").value;
//     var selectedTech = document.querySelectorAll('input[type="checkbox"]:checked').value;
	
    $("#progress").show();
    
	$.ajax({
		type:"post"
		, url: "/code/write.do"
		, data: 
			{"codeCategory": codeCategory
			, "codeLanguage": codeLanguage
			, "sourceFile" : sourceFile
// 			, "selectedTech" : selectedTech 
			}
		, dataType: "text"
		, success: function(data){
			console.log("----success----");
			$("#parseList").empty();
			$("#parseList").html(data);
			$('html, body').animate({
		        scrollTop: parseInt($("#parseList").offset().top)
		    }, 2000);
			preview();
		}
		, error : function(e){
			console.log("----error----");
			console.log(e.responseText);
		}
	});
});
</script>
<%@include file="../main/footer.jsp" %>