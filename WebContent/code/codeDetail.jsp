<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="codeDetail" class="card">
	<div class="card-header d-flex justify-content-between align-items-center">
		<h5 id="codeTitle"><span class="mr-2 h6 badge badge-pill badge-warning">${code.language }</span>${code.codeTitle }</h5>
		<button class="btn btn-warning btn-sm" onclick="copyToClipboard();">복사 </button>
	</div>
	<div class="card-body">
		<pre><code id="codeSource" class="${code.language }">${code.codeSource }</code></pre>						
	</div>
	<div class="card-footer text-muted justify-content-between" >
		<p id="code_content" class="card-text">${code.codeContent }</p>
<%-- 		<c:forEach items="${code.tech }" var="techName" > --%>
<%-- 			<span class="badge badge-primary">${techName }</span> --%>
<%-- 		</c:forEach> --%>
		<button type="button" id="codeDelete" class="btn btn-danger btn-sm" onclick="deleteCode(${code.codeNo}, ${code.categoryNo });">삭제</button>
	</div>
</div><!-- end of card -->