<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="./styleloader.jsp" %>

<style>

.col, .col-lg-6 {
	margin: 10;
}


/*
.table .text {
  position: relative;
}
.table .text span {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  position: absolute;
  left: 0; 
  right: 0; 
}
.text:before {
  content: '';
  display: inline-block;
}
*/

/*
div { 
	width: 150px;
	height: 150px;
	overflow: scroll;
}
*/
/*
div td {
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  text-overflow: ellipsis;
  position: absolute;

}
*/

div td {
 white-space:nowrap;
 overflow:hidden;
 text-overflow:ellipsis;
 }

</style>

<%-- 수정일 : 2018.09.14 / 수정자 : 권미현 / 로그아웃 처리 되었음을 알림 --%>
<%if(request.getAttribute("logout") != null && (boolean) request.getAttribute("logout")) { %>
	<script type="text/javascript">
		alert("로그아웃 되었습니다.")
	</script>
<%} %>

<div class="container mt-1"><!-- Container start -->
		<div id="loginAlert" class="alert alert-dismissible fade show" role="alert">
			<span id="loginText"></span>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		
		<div id="signupAlert" class="alert alert-dismissible fade show" role="alert">
			<span id="SignupText"></span>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>		
		
	
	<div class="row mt-5"><!-- first row start -->
	
	<div class="col-lg-6 table-responsive"><!-- board1 start -->
        
		<h4>
			<i class="far fa-comments fa-lg"></i>자유게시판
		</h4>
		
		<div class="text-right">
		<a href="/Freeboard/free.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
		
			<table class="table table-hover table-bordered table-sm " style="table-layout:fixed; width:100%;">
				<thead>
				
					<tr class="table-active">
						<th width="10%"><i class="fab fa-slack-hash fa-sm"></i></th>
						<th width="16%">작성일</th>
						<th width="50%">제목</th>
						<th width="10%"><i class="fas fa-pen fa-sm"></i></th>
						<th width="7%"><i class="fas fa-eye fa-sm"></i></th>
						<th width="7%"><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${FreeList }" var="board">
						<tr>
							<td><small>${board.boardNo }</small></td>
							<td><small>${board.boardCreate }</small></td>
							<td><small>
								<a href="/Freeboard/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</small></td>
							<c:choose >
								<c:when test="${loginType eq null }">
								<td><small>${board.boardNick }</small></td>
								</c:when>
								<c:when test="${loginType ne null }">
								<td><small>${board.boardUser }</small></td>
								</c:when>
							</c:choose>
							<td><small>${board.boardRead }</small></td>
							<td><small>${board.boardRecommend }</small></td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
	
		
	</div><!-- board1 END -->
       
    <div class="col-lg-6"><!-- board2 start -->
    	
    	<h4>
			<i class="fa fa-bullhorn fa-fw mr-3"></i>공지사항
		</h4>
		
		<div class="text-right">
		<a href="/notice/notice.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
	
			<table class="table table-hover table-bordered table-sm" style="table-layout:fixed; width:100%;">
				<thead>
					<tr class="table-active">
						<th width="10%"><i class="fab fa-slack-hash fa-sm"></i></th>
						<th width="16%">작성일</th>
						<th width="50%">제목</th>
						<th width="10%"><i class="fas fa-pen fa-sm"></i></th>
						<th width="7%"><i class="fas fa-eye fa-sm"></i></th>
						<th width="7%"><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${NoticeList }" var="board">
						<tr>
							<td><small>${board.boardNo }</small></td>
							<td><small>${board.boardCreate }</small></td>
							<td><small>
								<a href="/notice/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</small></td>
							<c:if test="${loginType eq null }">
								<td><small>${board.boardNick }</small></td>
							</c:if>	
							<c:if test="${loginType ne null }">
								<td><small>${board.boardUser }</small></td>
							</c:if>
							<td><small>${board.boardRead }</small></td>
							<td><small>${board.boardRecommend }</small></td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
	
		
	</div><!-- board2 END -->
	
	</div><!-- first row END -->
	
	<div class="row"><!-- second row start -->
	
	<div class="col-lg-6"><!-- board3 start -->
	
		<h4>
			<i class="fa fa-users fa-fw mr-3"></i>구인구직
		</h4>
		
		<div class="text-right">
		<a href="/recruit/recruit.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
		
			<table class="table table-hover table-bordered table-sm" style="table-layout:fixed; width:100%;">
				<thead>
					<tr class="table-active">
						<th width="10%"><i class="fab fa-slack-hash fa-sm"></i></th>
						<th width="16%">작성일</th>
						<th width="50%">제목</th>
						<th width="10%"><i class="fas fa-pen fa-sm"></i></th>
						<th width="7%"><i class="fas fa-eye fa-sm"></i></th>
						<th width="7%"><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${RecruitList }" var="board">
						<tr>
							<td><small>${board.boardNo }</small></td>
							<td><small>${board.boardCreate }</small></td>
							<td><small><!--<td style="text-overflow:ellipsis; overflow:hidden">  -->
								<a href="/recruit/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</small></td>
							<c:if test="${loginType eq null }">
								<td><small>${board.boardNick }</small></td>
							</c:if>	
							<c:if test="${loginType ne null }">
								<td><small>${board.boardUser }</small></td>
							</c:if>
							<td><small>${board.boardRead }</small></td>
							<td><small>${board.boardRecommend }</small></td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		

		</div><!-- board3 END -->
	
	<div class="col-lg-6"><!-- board4 start -->
		
		<h4>
			<i class="fa fa-question-circle fa-fw mr-3"></i>Q&A
		</h4>
		
		<div class="text-right">
		<a href="/question/Q&A.do" class="badge badge-warning badge-pill">더보기</a>
		</div>
		
			<table class="table table-hover table-bordered table-sm" style="table-layout:fixed; width:100%;">
				<thead>
					<tr class="table-active">
						<th width="10%"><i class="fab fa-slack-hash fa-sm"></i></th>
						<th width="16%">작성일</th>
						<th width="50%">제목</th>
						<th width="10%"><i class="fas fa-pen fa-sm"></i></th>
						<th width="7%"><i class="fas fa-eye fa-sm"></i></th>
						<th width="7%"><i class="far fa-thumbs-up fa-sm"></i></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${QuestionList }" var="board">
						<tr>
							<td><small>${board.boardNo }</small></td>
							<td><small>${board.boardCreate }</small></td>
							<td><small>
								<a href="/question/detail.do?boardno=${board.boardNo }">${board.boardTitle }</a>
							</small></td>
							<c:if test="${loginType eq null }">
								<td><small>${board.boardNick }</small></td>
							</c:if>	
							<c:if test="${loginType ne null }">
								<td><small>${board.boardUser }</small></td>
							</c:if>
							<td><small>${board.boardRead }</small></td>
							<td><small>${board.boardRecommend }</small></td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
	
	
		</div><!-- board4 END -->
		
	</div><!-- second row END -->
       
</div><!-- containter END -->
       
<%@include file="../main/scriptloader.jsp" %>
<script type="text/javascript">
$(document).ready(function(){	
	$("#loginAlert").hide();
	$("#signupAlert").hide();
	
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
	
	//쿼리스트링에서 로그인 값 가져옴
	var signup= getQueryStringObject().signup;
	
	if(signup=="fail") {
		//로그인 실패 - 경고 창 보여줌
		$("#signupAlert").show();
		$("#signupAlert").addClass("alert-danger");
		$("#SignupText").text("회원가입에 실패했습니다");

	} else if(signup=="success") {
		//로그인 성공 - 환영 메시지 보여줌
		$("#signupAlert").show();
		$("#signupAlert").addClass("alert-success");
		$("#SignupText").text("회원가입에 성공했습니다. 로그인해주세요.");
	}
	
	// 경고창 x 버튼 클릭시 경고창 사라짐
	$("#signupAlert").click(function(){
        $(this).hide();
    });
	
});

</script>
<%@include file="../main/footer.jsp"%>