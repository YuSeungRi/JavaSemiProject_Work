<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
code게시판 Main 
 --%>
<%@include file="../main/header.jsp" %>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../highlight/styles/default.css">
<style type="text/css">
.wrapper-scroll-y {
  display: block;
  max-height: 350px;
  overflow-y: auto;
  -ms-overflow-style: -ms-autohiding-scrollbar;
}
</style>
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
<h1><span class="fa fa-sign-in-alt fa-fw mr-1"></span>코드관리 - Kit!</h1>
	<div class="row justify-content-center">
		<!-- 코드 카테고리 -->
		<div id="codeCategory" class="col-sm-4 mt-3">
			<div class="list-group wrapper-scroll-y">
				<div class="list-group-item list-group-item-secondary d-flex justify-content-between align-items-center"><h5>Category</h5>
					<button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#addCategory">추가</button>
				</div>
				<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
					All
					<span class="badge badge-primary badge-pill">${allCount }</span>
				</a>
				<c:forEach items="${allCategory}" var="category">
					<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
						<div>${category.categoryName }<span class="badge badge-primary badge-pill ml-2">${category.categoryCount }</span></div>
						<button name="${category.categoryNo }" class="btn btn-sm btn-transparent"><span>&times;</span></button>
					</a>
				</c:forEach>
				
			</div><!-- end of list-group -->
		</div><!-- end of codeCategory -->
		<!-- 코드 목록 -->
		<div id="codeList" class="col-sm-8 mt-3 wrapper-scroll-y">
			<table class="table table-hover table-bordered table-sm table-striped ">	
          		<thead class="fixedHeader">
					<tr >
						<th>#</th>
						<th hidden="true">
						<th>Title</th>
						<th>Tech</th>
					</tr>
				</thead>
				<tbody>
					<% int idx=0; %>
					<c:forEach items="${codeList }" var="code">
						<tr onclick="viewDetail(${code.codeNo});">
							<td><%=++idx %></td>
							<td hidden="true">${code.codeNo }</td>
							<td>${code.codeTitle }</td>
							<td>
								<c:set var="items" value="${code.tech }" />
								<%if(pageContext.getAttribute("items") instanceof ArrayList<?>){
									ArrayList<?> arrStr = (ArrayList<?>)pageContext.getAttribute("items"); 
									for(Object tech: arrStr) {%>
										<span class="badge badge-primary"><%=tech %></span>
								<%	} 
								}%>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- end of code list -->
	</div><!-- end of first row -->
	<div class="row mt-3">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h5>DBConn 코드</h5>
					<button class="btn btn-warning btn-sm" onclick="copyToClipboard();">복사 </button>
				</div>
				<div class="card-body">
					<pre><code id="codeContent" class="java">   
	public static Connection getConnection() {
		if( conn == null ) { // DB연결이 안 되어있을 때만 동작
			try {
				Class.forName(DRIVER); //드라이버로드
				conn = DriverManager.getConnection(URL, USERNAME, PASSWORD); //DB연결
	
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn; //DB연결객체 반환
	}
					</code></pre>						
				</div>
				<div class="card-footer text-muted">
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					<span class="badge badge-primary">Java</span>
					<span class="badge badge-primary">Oracle</span>
					<span class="badge badge-primary">JSP/Servlet</span>
				</div>
			</div>
		</div>
	</div><!-- end of second row -->
</div> <!-- end of content -->

<!-- Modal -->
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="addCategoryTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addCategory">Add new Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form>
      	<div class="modal-body">
		  <div class="form-group">
		    <label for="newCategory">Category Name</label>
		    <input type="text" class="form-control" id="newCategory" aria-describedby="CategoryHelp" />
		    <small id="emailHelp" class="form-text text-muted">카테고리 명을 입력하세요.</small>
		  </div>
      	</div>
	    <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
 		    <button type="submit" class="btn btn-primary">Submit</button>
	    </div>
  	  </form>
    </div>
  </div>
</div>

<%@include file="../main/scriptloader.jsp" %>
<%-- highlight.js --%>
<script src="../highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<script type="text/javascript">
//Ajax for Code List Table
$.ajax({
	type:"post"
	, url: "/code/codeList.do"
	, data: {"userEmail":${sessionScope.userId} , "categoryNo":${} }
	, dataType: "json"
	, success: function(data){
		console.log("----success----");
		console.log(data);
		$("#resultLayout").html(data.result);
	}
	, error : function(e){
		console.log("----error----");
		console.log(e.responseText);
	}
	, complete: function(){

	}
});




//copy to clipboard
var copyToClipboard = function() {
	const el = document.createElement('textarea');
	el.value = document.getElementById("codeContent").textContent;
	el.setAttribute('readonly', '');
	el.style.position = 'absolute';
	el.style.left = '-9999px';
	document.body.appendChild(el);
	el.select();
	document.execCommand('copy');
	document.body.removeChild(el);
	alert("클립보드에 복사 되었습니다.");
};

</script>
<%@include file="../main/footer.jsp" %>