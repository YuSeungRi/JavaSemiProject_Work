<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- parse result && input code -->
<c:forEach items="parsedCodes" var="code"> 
	<div class="col-11">
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
							<input type="text" id="inputCategory" class="form-control" name="inputCategory" value="${category }" readonly="readonly"/>
						</div>
						<div class="col-md-5 form-group">
							<label for="inputLanguage">Language</label>
							<input type="text" id="inputLanguage" class="form-control" name="inputLanguage" value="${code.language }" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inputCode">제목</label>
						<input type="text" id="codeTitle" name="codeTitle" class="form-control"  value="${code.codeTitle }"/>
					</div>
					<div class="form-group">
						<label for="inputCode">kit 코드</label>
						<textarea class="form-control" id="inputCode" rows="5" oninput="preview();" >${code.codeSoruce}</textarea>
					</div>
					<div class="form-group">
						<label for="previewCode">미리보기</label>
						<pre><code id="previewCode"></code></pre>
					</div>
				</div><!--  end of card-body -->
				<div class="card-body">
					<h6 class="card-text">적용 기술</h6>
					<div id="techSelect" class="form-group form-check clearfix">
						<c:set var="techs" value="${code.tech }" />
						<c:forEach items="${techList }" var="tech">
							<div class="float-left m-2">
							<c:if test="${tech.techNo eq techs.techNo}" >
								<input type="checkbox" id="${tech.techNo }" name="${tech.techNo }" value="${tech.techNo }" checked="checked" readonly="readonly"/>
							</c:if>
							<c:if test="${tech.techNo ne techs.techNo}" >
								<input type="checkbox" id="${tech.techNo }" name="${tech.techNo }" value="${tech.techNo }" readonly="readonly"/>
							</c:if>
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
</c:forEach>
