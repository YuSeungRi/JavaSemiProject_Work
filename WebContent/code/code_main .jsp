<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
code게시판 Main 
 --%>
<%@include file="../main/header.jsp" %>

<%-- 여기에 페이지에 사용할 css파일을 링크하세요.  --%>
<link rel="stylesheet" href="../highlight/styles/default.css">
<style type="text/css">
/* set table header to a fixed position. WinIE 6.x only                                       */
/* In WinIE 6.x, any element with a position property set to relative and is a child of       */
/* an element that has an overflow property set, the relative value translates into fixed.    */
/* Ex: parent element DIV with a class of tableContainer has an overflow property set to auto */
thead.fixedHeader tr {
	position: relative
}

/* set THEAD element to have block level attributes. All other non-IE browsers            */
/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
html>body thead.fixedHeader tr {
	display: block
}

/* make the TH elements pretty */
thead.fixedHeader th {
	text-align: left
}

/* make the A elements pretty. makes for nice clickable headers                */
thead.fixedHeader a, thead.fixedHeader a:link, thead.fixedHeader a:visited {
	color: #FFF;
	display: block;
	text-decoration: none;
	width: 100%
} 
</style>
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
<h1><span class="fa fa-sign-in-alt fa-fw mr-1"></span>코드관리 - Kit!</h1>
	<div class="row justify-content-center">
		<!-- 코드 카테고리 -->
		<div id="codeCategory" class="col-md-6">
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">All<span class="badge badge-primary badge-pill">100</span></a>
				<a href="#" class="list-group-item list-group-item-action">Java<span class="badge badge-primary badge-pill">14</span></a>
				<a href="#" class="list-group-item list-group-item-action">C#<span class="badge badge-primary badge-pill">14</span></a>
				<a href="#" class="list-group-item list-group-item-action">SQL<span class="badge badge-primary badge-pill">14</span></a>
				<a href="#" class="list-group-item list-group-item-action">JSP/Servlet<span class="badge badge-primary badge-pill">14</span></a>
				<a href="#" class="list-group-item list-group-item-action">PHP<span class="badge badge-primary badge-pill">14</span></a>
				<a href="#" class="list-group-item list-group-item-action">JavaScript<span class="badge badge-primary badge-pill">0</span></a>
				<a href="#" class="list-group-item list-group-item-action">jQuery</a>
				<a href="#" class="list-group-item list-group-item-action">Add new +</a>
			</div><!-- end of list-group -->
		</div><!-- end of codeCategory -->
		<!-- 코드 목록 -->
		<div id="codeList" class="col-md-6">
			<table class="table table-hover table-condensed" border="0" cellpadding="0" cellspacing="0" width="100%">	
          	<thead class="fixedHeader">
					<tr>
						<th>#</th>
						<th>Product</th>
						<th>Payment Taken</th>
					</tr>
				</thead>
				<tbody style="display: block;overflow: auto;height: 100px;width: 400px;">
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
					</tr>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Approved</td>
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
				</tbody>
			</table>
		</div><!-- end of code list -->
	</div><!-- end of first row -->
	<div class="row">
		<!-- 코드 내용 -->
		<div class="codeDetail" class="col-12 col-md-8">
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
		<!-- 코드 메타정보 -->
		<div id="codeMeta" class="col-12 col-md-3">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					<a href="#" class="card-link">Card link</a>
					<a href="#" class="card-link">Another link</a>
				</div>
			</div>
		</div><!-- end of codeMeta -->
	</div><!-- end of second row -->
</div> <!-- end of content -->





<%@include file="../main/scriptloader.jsp" %>
<%-- highlight.js --%>
<script src="../highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<%@include file="../main/footer.jsp" %>