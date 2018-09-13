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
<div class="container">
<h1><span class="fa fa-sign-in-alt fa-fw mr-1"></span>코드관리 - Kit!</h1>
	<div class="row justify-content-center">
		<div class="col-sm-1 offset-sm-9">
			<button type="button" id="newCode" class="btn btn-warning">New Code</button>
		</div>
	</div>
	<div class="row justify-content-center">
		<!-- 코드 카테고리 -->
		<div id="codeCategory" class="col-sm-4 mt-3">
			<div class="list-group wrapper-scroll-y">
				<div class="list-group-item list-group-item-secondary d-flex justify-content-between align-items-center"><h5>Category</h5>
					<button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#addCategory">추가</button>
				</div>
				<div class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="viewList(0)">
					All
					<span class="badge badge-primary badge-pill">${allCount }</span>
				</div>
				<c:forEach items="${allCategory}" var="category">
					<div onclick="viewList(${category.categoryNo })" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" >
						<div>${category.categoryName }<span class="badge badge-primary badge-pill ml-2">${category.categoryCount }</span></div>
						<button onclick="deleteCategory(${category.categoryNo},${category.categoryCount })" name="${category.categoryNo }" class="btn btn-sm btn-transparent"><span>&times;</span></button>
					</div>
				</c:forEach>
				
			</div><!-- end of list-group -->
		</div><!-- end of codeCategory -->
		<!-- 코드 목록 -->
		<div id="codeList" class="col-sm-7 mt-3 wrapper-scroll-y">
			<table class="table table-hover table-bordered table-sm table-striped ">	
          		<thead class="fixedHeader">
					<tr >
						<th>#</th>
						<th hidden="true">
						<th>Title</th>
						<th>Language</th>
						<th>설명</th>
					</tr>
				</thead>
				<tbody>
					<% int idx=0; %>
					<c:forEach items="${codeList }" var="code">
						<tr onclick="viewDetail(${code.codeNo});">
							<td><%=++idx %></td>
							<td hidden="true">${code.codeNo }</td>
							<td>${code.codeTitle }</td>
							<td>${code.language }</td>
<!-- 							<td> -->
<%-- 								<c:set var="items" value="${code.tech }" /> --%>
<%-- 								<%if(pageContext.getAttribute("items") instanceof ArrayList<?>){ --%>
<%--//  									ArrayList<?> arrStr = (ArrayList<?>)pageContext.getAttribute("items");--%> 
<%-- 									for(Object tech: arrStr) {%> --%>
<%-- 										<span class="badge badge-primary"><%=tech %></span> --%>
<%-- 								<%	}  --%>
<%-- 								}%> --%>
<!-- 							</td> -->
							<td>${code.codeContent }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- end of code list -->
	</div><!-- end of first row -->
	<div class="row my-3 justify-content-center">
		<div class="col-sm-11">
			<div id="codeDetail" class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h5 id="codeTitle"><span class="mr-2 h6 badge badge-pill badge-warning">Java</span>DBConn 코드</h5>
					<button class="btn btn-warning btn-sm" onclick="copyToClipboard();">복사 </button>
				</div>
				<div class="card-body">
					<pre><code id="codeSource" class="java">   
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
					<p id="code_content" class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
<!-- 					<span class="badge badge-primary">Java</span> -->
<!-- 					<span class="badge badge-primary">Oracle</span> -->
<!-- 					<span class="badge badge-primary">JSP/Servlet</span> -->
				</div>
			</div><!-- end of card -->
		</div><!-- end of col -->
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
  		<div class="modal-body">
			<div class="form-group">
				<label for="newCategory">Category Name</label>
				<input type="text" class="form-control" id="newCategory" aria-describedby="CategoryHelp" />
				<small id="emailHelp" class="form-text text-muted">카테고리 명을 입력하세요.</small>
			</div>
	  	</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="submit" class="btn btn-primary" onclick="addCategory();">Submit</button>
		</div>
    </div>
  </div>
</div>

<%@include file="../main/scriptloader.jsp" %>
<%-- highlight.js --%>
<script src="../highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<script type="text/javascript">
//Ajax for Code List Table
var viewList = function(categoryNo) {
	$.ajax({
		type:"post"
		, url: "/code/codeList.do"
		, data: { "categoryNo": categoryNo }
		, dataType: "text"
		, success: function(data){
// 			console.log("----success----");
			$("#codeList").empty();
			$("#codeList").html(data);
		}
		, error : function(e){
			console.log("----error----");
			console.log(e.responseText);
		}
// 		, complete: function(){
// 			console.log("----complete----");
// 		}
	});
}

// Ajax for Add category
var addCategory = function() {
	var categoryName = $("#newCategory").val();
	$.ajax({
		type:"post"
		, url: "/code/codeCategory.do"
		, data: { "mode": "create", "categoryName" : categoryName }
		, dataType: "text"
		, success: function(data){
			console.log("----success----");
			$("#codeCategory").empty();
			$("#codeCategory").html(data);
		}
		, error : function(e){
			console.log("----error----");
			console.log(e.responseText);
		}
		, complete: function(){
			$("#newCategory").val("");
			$("#addCategory").modal('toggle');
		}
	});
}

//Ajax for Delete category
var deleteCategory = function(categoryNo, categoryCount) {
	if(categoryCount != 0){
		alert("카테고리에 자료가 남아 있으면 삭제하실 수 없습니다.");
		return;
	} else {
		var check = confirm("정말 삭제하시겠습니까?");
		if(check != true) {
			return;
		}
	}
	$.ajax({
		type:"post"
		, url: "/code/codeCategory.do"
		, data: { "mode": "delete", "categoryNo" : categoryNo }
		, dataType: "text"
		, success: function(data){
			console.log("----success----");
			$("#codeCategory").empty();
			$("#codeCategory").html(data);
			alert("삭제 되었습니다.");
		}
		, error : function(e){
			console.log("----error----");
			console.log(e.responseText);
		}
	});
};

//Aajx get a code. 
var viewDetail = function(codeNo) {
	$.ajax({
		type:"post"
		, url: "/code/code.do"
		, data: { "codeNo" : codeNo }
		, dataType: "text"
		, success: function(data){
			console.log("----success----");
			$("#codeDetail").empty();
			$("#codeDetail").html(data);
			$("pre code").each(function(i, block){
				hljs.highlightBlock(block);
			});
		}
		, error : function(e){
			console.log("----error----");
			console.log(e.responseText);
		}
	});
};

//Ajax for delete a code
var deleteCode = function(codeNo){
	$.ajax({
		type:"post"
		, url: "/code/delete.do"
		, data: { "codeNo" : codeNo }
		, dataType: "text"
		, success: function(data){
			console.log("----success----");
			$("#codeDetail").empty();
			console.log(data);
		}
		, error : function(e){
			console.log("----error----");
			console.log(e.responseText);
		}
	});
};

//copy to clipboard
var copyToClipboard = function() {
	const el = document.createElement('textarea');
	el.value = document.getElementById("codeSource").textContent;
	el.setAttribute('readonly', '');
	el.style.position = 'absolute';
	el.style.left = '-9999px';
	document.body.appendChild(el);
	el.select();
	document.execCommand('copy');
	document.body.removeChild(el);
	alert("클립보드에 복사 되었습니다.");
};

$("#newCode").on("click", function(){
	window.location.href="/code/write.do";
	return false;
});

</script>
<%@include file="../main/footer.jsp" %>