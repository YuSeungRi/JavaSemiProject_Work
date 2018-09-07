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
	<h1><span class="fa fa-sign-in-alt fa-fw mr-1"></span>코드관리 - Kit! 코드 작성</h1>
	<div class="row mt-3">
		<div class="col-11">
			<!-- source code uploader -->
			<div class="card">
				<form action="/code/kitParser.do" method="post" enctype="multipart/form-data">
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
						
					</div>
					<div class="card-body">
						<h6 class="card-text">적용 기술</h6>
						<button id="techOpen" class="btn btn-warning btn-sm" type="button" >펼치기</button>
						<div id="techSelect" class="form-group form-check clearfix">
							<c:forEach items="${techList }" var="tech">
								<div class="float-left m-2">
									<input type="checkbox" id="${tech.techNo }" name="${tech.techNo }" value="${tech.techNo }" />
									<label class="form-check-label" for="${tech.techNo }">${tech.techName }</label>
								</div>
							</c:forEach>
						</div>
						<div class="input-group col-lg-6">
							<input type="text" class="form-control" placeholder="적용기술추가" aria-label="적용기술추가" aria-describedby="newTech">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="newTech">Add</button>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button id="btnHelp" type="button" class="btn btn-warning">kit 사용법?</button>
						<input type="submit" class="btn btn-primary" value="파일 업로드"/>
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
			<form action="/code/write.do" method="post">
			
			</form>
		</div>
	</div>
</div>
<%@include file="../main/scriptloader.jsp" %>
<%-- highlight.js --%>
<script src="../highlight/highlight.pack.js"></script>
<%@include file="../main/footer.jsp" %>