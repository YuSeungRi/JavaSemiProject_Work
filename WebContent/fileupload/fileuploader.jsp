<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col">
		<form class="form-inline" action="/file/upload.do" method="post">
			<div hidden="true">
				<input type="text" readonly id="file_boardNo" name="boardNo" value="${param.boardNo }" />
			</div>
			<div class="form-group">
				<label for="fileUp">파일 업로드</label>
				<input type="file" class="form-control-file" id="fileUp" name="fileUp" />
			</div>
			<button type="submit" class="btn btn-primary mb-2">전송</button>
		</form>	
	</div>
	
	<div class="col">
		<div class="form-group">
			<label for="uplodedFile">업로드된 파일 </label>
			<select class="form-control" id="uploadedFile" >
				<c:forEach items="${fileList }" var="file">
					<option value="${file.fileNo }" ondblclick="download(${file.storedFileName })">${file.fileName }</option>
				</c:forEach>
			</select>
			
		</div>
	</div>
</div>

<script type="text/javascript">
var download = function(storeFileName) {
	var downloadPath = "<%=getServletContext().getRealPath("upload")%>" + storeFileName;
	document.open(downloadPath);	
};
</script>