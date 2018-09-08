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
				<form id="uploadForm" method="post" enctype="multipart/form-data">
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
						</div>
					</div><!--  end of card-body -->
					<div class="card-body">
						<h6 class="card-text">적용 기술</h6>
						<button id="techOpen" class="btn btn-warning btn-sm" type="button" >펼치기/접기</button>
						<div id="techSelect" class="form-group form-check clearfix">
							<c:forEach items="${techList }" var="tech">
								<div class="float-left m-2">
									<input type="checkbox" id="${tech.techNo }" name="${tech.techNo }" value="${tech.techNo }" />
									<label class="form-check-label" for="${tech.techNo }">${tech.techName }</label>
								</div>
							</c:forEach>
						
							<div class="input-group">
								<input type="text" class="form-control" placeholder="적용기술추가" aria-label="적용기술추가" aria-describedby="newTech">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button" id="newTech">Add</button>
								</div>
							</div>
						</div> <!-- end of form-check -->
					</div><!-- end of card-body -->
					<div class="card-footer">
						<button id="btnHelp" type="button" class="btn btn-warning">kit 사용법?</button>
						<button id="btnSubmit" class="btn btn-primary" >파일 업로드</button>
					</div>
				</form>
			</div>
		</div> <!-- end of col -->
		<div class="col-11" id="uploadResult"></div>
	</div><!-- end of first row -->
	<div class="row my-3">
		<div class="col-11 text-center">
			<p> 또는...</p>
		</div>
	</div>
	<div class="row">
		<div class="col-11">
			<!-- parse result && input code -->
			<div id="parseResult" class="card my-2">
				<form action="/code/write.do" method="post">
					<div class="card-header">
						<h5 class="card-title">내용 확인</h5>
					</div>
						<div class="card-body">
							<p class="card-text">불러온 데이터를 확인하고 필요하면 수정 후 저장 해주세요.</p>
							<div class="row">
								<div class="col-md-5 form-group">
									<label for="inputCategory">Category</label>
									<input type="text" id="inputCategory" class="form-control" name="inputCategory" value="" readonly="readonly"/>
								</div>
								<div class="col-md-5 form-group">
									<label for="inputLanguage">Language</label>
									<input type="text" id="inputLanguage" class="form-control" name="inputLanguage" value="" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputCode">kit 코드</label>
								<textarea class="form-control" id="inputCode" rows="5" oninput="preview();" ></textarea>
							</div>
							<div class="form-group">
								<label for="previewCode">미리보기</label>
								<pre><code id="previewCode"></code></pre>
							</div>
						</div><!--  end of card-body -->
						<div class="card-body">
							<h6 class="card-text">적용 기술</h6>
							<div id="techSelect" class="form-group form-check clearfix">
								<c:forEach items="${techList }" var="tech">
									<div class="float-left m-2">
										<input type="checkbox" id="${tech.techNo }" name="${tech.techNo }" value="${tech.techNo }" checked="checked" readonly="readonly"/>
										<label class="form-check-label" for="${tech.techNo }">${tech.techName }</label>
									</div>
								</c:forEach>
							</div> <!-- end of form-check -->
						</div><!-- end of card-body -->
						<div class="card-footer">
							<button id="btnDelete" type="button" class="btn btn-warning mr-3">삭제</button>
							<input type="submit" class="btn btn-primary" value="저장"/>
						</div>
				</form>
			</div><!-- end of card -->
		</div><!-- end of col -->
	</div><!-- end of row  -->
</div>
<%@include file="../main/scriptloader.jsp" %>
<%-- highlight.js --%>
<script src="../highlight/highlight.pack.js"></script>
<script type="text/javascript">

$("#techSelect").hide();
$("#techOpen").click(function() {
	$("#techSelect").toggle();
});

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


$("#btnSubmit").on("click", function() {
	event.stopPropagation(); 
    event.preventDefault(); 
    
    var data = new FormData(document.getElementById("uploadForm"));
//     data.append("codeCategory", $("#codeCategory option:selected").val());
//     data.append("codeLanguage", $("#codeLanguage option:selected").val());
	
//     var files = $(this).prop("files"); 
// 	if(files.length >0) {
// 		data.append("file", files[0]);
// 	}
// 	var file = $("input[name='file']");
// 	var filename = $.trim(file.val());
// 	data.append(file)
	
// 	var techList = $("input[type='checkbox']");
// 	var selectedTech = new Array();
// 	for(var i=0;i<techList.length;i++){
// 		if(techList[i].checked) {
// 			selectedTech.push(techList[i].value);
// 		}
// 	}
// 	data.append("selectedTech", selectedTech);
	
	postFilesData(data);
});

//Ajax for file upload 
var postFilesData = function(data) {
	$.ajax({
		url: '/code/write.do'
		, type: 'POST'
		, data: data
		, cache: false
		, dataType: 'text'
		, processData: false
		, contentType: false
		, success: function(data, textStatus, jqXHR){
			//success
			
			$("html body").animate({
				scrollTop: $("#parseResult").offset().top
			}, 2000);
		}
		, error: function(jqXHR, textStatus, errorThrown) {
		    console.log('ERRORS: ' + textStatus);
		}
	});
}

</script>

<%@include file="../main/footer.jsp" %>