<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="./styleloader.jsp" %>

<div class="container m-3">	
<!-- 탬플릿 부분(상단) -->
	
	<div class="col mt-1"><!-- Main Col start -->
	
	<div class="container"><!-- Container start -->
		<div id="loginAlert" class="alert alert-dismissible fade show" role="alert">
			<span id="loginText"></span>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	
	<div class="row"><!-- first row start -->
	
	<div class="col-md-6"><!-- board1 start -->
        
		<h4>
			<i class="far fa-comments fa-lg"></i>자유게시판
		</h4>
		
		<div class="text-right">
		<a href="/Freeboard/free.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
		
			<table class="table table-hover table-bordered table-sm">
				<thread>
					<tr class="table-active">
						<th>글번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thread>
				
				<tbody>
					<c:forEach items="${FreeList }" var="board">
						<tr>
							<td>${board.boardNo }</td>
							<td>${board.boardCreate }</td>
							<td>
								<a href="/Freeboard/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<td>${board.boardUser }</td>
							
							<td>${board.boardRead }</td>
							<td>${board.boardRecommend }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
	
		
	</div><!-- board1 END -->
       
    <div class="col-md-6"><!-- board2 start -->
    	
    	<h4>
			<i class="fa fa-bullhorn fa-fw mr-3"></i>공지사항
		</h4>
		
		<div class="text-right">
		<a href="/notice/notice.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
	
			<table class="table table-hover table-bordered table-sm">
				<thread>
					<tr class="table-active">
						<th>글번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thread>
				
				<tbody>
					<c:forEach items="${NoticeList }" var="board">
						<tr>
							<td>${board.boardNo }</td>
							<td>${board.boardCreate }</td>
							<td>
								<a href="/notice/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<td>${board.boardUser }</td>
							<td>${board.boardRead }</td>
							<td>${board.boardRecommend }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
	
		
	</div><!-- board2 END -->
	
	</div><!-- first row END -->
	
	<div class="row"><!-- second row start -->
	
	<div class="col-md-6"><!-- board3 start -->
	
		<h4>
			<i class="fa fa-users fa-fw mr-3"></i>구인구직
		</h4>
		
		<div class="text-right">
		<a href="/recruit/recruit.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
		
			<table class="table table-hover table-bordered table-sm">
				<thread>
					<tr class="table-active">
						<th>글번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thread>
				
				<tbody>
					<c:forEach items="${RecruitList }" var="board">
						<tr>
							<td>${board.boardNo }</td>
							<td>${board.boardCreate }</td>
							<td>
								<a href="/recruit/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<td>${board.boardUser }</td>
							<td>${board.boardRead }</td>
							<td>${board.boardRecommend }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		

		</div><!-- board3 END -->
	
	<div class="col-md-6"><!-- board4 start -->
		
		<h4>
			<i class="fa fa-question-circle fa-fw mr-3"></i>Q&A
		</h4>
		
		<div class="text-right">
		<a href="/question/Q&A.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
		
			<table class="table table-hover table-bordered table-sm">
				<thread>
					<tr class="table-active">
						<th>글번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thread>
				
				<tbody>
					<c:forEach items="${QuestionList }" var="board">
						<tr>
							<td>${board.boardNo }</td>
							<td>${board.boardCreate }</td>
							<td>
								<a href="/question/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</td>
							<td>${board.boardUser }</td>
							<td>${board.boardRead }</td>
							<td>${board.boardRecommend }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
	
	
		</div><!-- board4 END -->
		
	</div><!-- second row END -->
       
   	</div><!-- containter END -->
       
    </div><!-- Main Col END -->
    
	
<!-- 탬플릿 부분(하단) -->
</div>	
<%@include file="../main/scriptloader.jsp" %>
<script type="text/javascript">
$(document).ready(function(){	
	$("#loginAlert").hide();
	
	//쿼리스트링 값을 Array로 가져오는 함수 
	function getQueryStringObject() {
	    var a = window.location.search.substr(1).split('&');
	    if (a == "") return {};
	    var b = {};
	    for (var i = 0; i < a.length; ++i) {
	        var p = a[i].split('=', 2);
	        if (p.length == 1)
	            b[p[0]] = "";
	        else
	            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
	    }
	    return b;
	}
	
	//쿼리스트링에서 로그인 값 가져옴
	var login= getQueryStringObject().login;
	
	if(login=="fail") {
		//로그인 실패 - 경고 창 보여줌
		$("#loginAlert").show();
		$("#loginAlert").addClass("alert-danger");
		$("#loginText").text("로그인 실패! 아이디 또는 패스워드가 일치하지 않습니다.");

	} else if(login=="success") {
		//로그인 성공 - 환영 메시지 보여줌
		var userNick = "${sessionScope.userNick }";
		$("#loginAlert").show();
		$("#loginAlert").addClass("alert-success");
		$("#loginText").text("반갑습니다! " + userNick + "님.");
	}
	
	// 경고창 x 버튼 클릭시 경고창 사라짐
	$("#loginAlert").click(function(){
        $(this).hide();
    });
});
</script>
<%@include file="../main/footer.jsp"%>