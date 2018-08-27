<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
code게시판 Main 
 --%>
<%@include file="../main/header.jsp" %>
<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../highlight/styles/default.css">
<style type="text/css">
.wrapper-scroll-y {
  display: block;
  max-height: 300px;
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
					<span class="badge badge-primary badge-pill">100</span>
				</a>
				<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
					<div>Java <span class="badge badge-primary badge-pill">14</span></div>
					<button name="Java" class="btn btn-sm btn-transparent"><span>&times;</span></button>
				</a>
				<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
					<div>Oracle <span class="badge badge-primary badge-pill">14</span></div>
					<button name="Java" class="btn btn-sm btn-transparent"><span>&times;</span></button>
				</a>
				<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
					<div>C# <span class="badge badge-primary badge-pill">14</span></div>
					<button name="Java" class="btn btn-sm btn-transparent"><span>&times;</span></button>
				</a>
				<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
					<div>C# <span class="badge badge-primary badge-pill">14</span></div>
					<button name="Java" class="btn btn-sm btn-transparent"><span>&times;</span></button>
				</a>
				<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
					<div>C# <span class="badge badge-primary badge-pill">14</span></div>
					<button name="Java" class="btn btn-sm btn-transparent"><span>&times;</span></button>
				</a>
				
			</div><!-- end of list-group -->
		</div><!-- end of codeCategory -->
		<!-- 코드 목록 -->
		<div id="codeList" class="col-sm-7 mt-3 wrapper-scroll-y">
			<table class="table table-hover table-bordered table-sm ">	
          	<thead class="fixedHeader">
					<tr>
						<th>#</th>
						<th>내용</th>
						<th>..?</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
					</tr>
					<tr>
						<td>2</td>
						<td>TB - Monthly</td>
						<td>02/04/2012</td>
					</tr>
					<tr>
						<td>3</td>
						<td>TB - Monthly</td>
						<td>03/04/2012</td>
					</tr>
					<tr>
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
					</tr>
					<tr>
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
					</tr>
					<tr>
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
					</tr>
					<tr>
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
					</tr>
					<tr>
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
					</tr>
					<tr>
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
					</tr>
				</tbody>
			</table>
		</div><!-- end of code list -->
	</div><!-- end of first row -->
	<div class="row mt-3">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h5>DBConn 코드</h5>
					<button class="btn btn-warning btn-sm">복사 </button>
				</div>
				<div class="card-body">
					<pre><code class="java">   
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
<%@include file="../main/footer.jsp" %>