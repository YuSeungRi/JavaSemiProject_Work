<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

<nav class="navbar navbar-expand-md bg-warning d-md-none">
  <button class="navbar-toggler navbar-toggler-right bg-white" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon fa fa-star text-warning pt-1"></span> 
  </button>
  <a class="navbar-brand" href="#">
    <img src="../img/logo1.png" width="90" height="40" alt="logo" class="d-inline-block align-top">
  </a>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav navbar-hover ">
      <li class="nav-item dropdown d-sm-block d-md-none">
			<a class="dropdown-item" href="/main/main.do">홈</a>
            <a class="dropdown-item" href="/notice/notice.do">공지사항</a>
            <a class="dropdown-item" href="/question/Q&A.do">Q & A </a>
            <a class="dropdown-item" href="/recruit/recruit.do">구인구직</a>
            <a class="dropdown-item" href="/Freeboard/free.do">자유게시판</a>
            <a class="dropdown-item" href="/tech/tech.do">기술동향</a>
            <hr>
            <a class="dropdown-item" href="/project/project.do">프로젝트</a>
            <a class="dropdown-item" href="/code/code.do">코드</a>
            <hr>
           <c:if test="${sessionScope.login eq true }" >
           <a class="dropdown-item" href="/user/logout.do">로그아웃</a>
            <a class="dropdown-item" href="/mypage/mypage.do">마이페이지</a>
            </c:if>
            <c:if test="${sessionScope.login ne true }">
             <a class="dropdown-item" href="/main/signin.do">로그인</a>
            </c:if>
              <hr>
            <c:if test="${'관리자' eq sessionScope.userNick }" >
            <a class="dropdown-item" href="/admin/userinfoadmin.do">회원관리</a>
            <a class="dropdown-item" href="/admin/statistics.do">통계관리</a>
            </c:if>
      </li><!-- Smaller devices menu END -->
      
    </ul>
  </div>
</nav><!-- NavBar END -->

<div class="row" id="body-row">
    <!-- Sidebar -->
    <div id="sidebar-container" class="sidebar-expanded d-none d-md-block bg-warning"><!-- d-* hiddens the Sidebar in smaller devices. Its itens can be kept on the Navbar 'Menu' -->
        <!-- Bootstrap List Group -->
        <ul class="list-group">
        	<!-- Logo -->
            <li class="bg-warning list-group-item logo-separator d-flex justify-content-center pb-5">
               <a href="/main/main.do">
                <img src='../img/logo1.png' width="70" height="40" alt="logo" />  
               </a>  
            </li>   
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
                <small></small>
            </li>
            <!-- /END Separator -->
            
            <li class="list-group-item list-group-item-action menu-collapsed bg-warning">
                <div class="d-flex flex-row w-100 justify-content-center ">
                <form action="/Main/search.do" name="search" method="get">
	                <div class="input-group input-group-sm mb-3">
					  <div class="input-group-prepend">
					    <button class="btn btn-outline-secondary" type="submit" id="button-addon1"><span class="fa fa-search" id="basic-addon1"></span></button>
					  </div>
					  <input type="text" class="form-control" placeholder="검색" aria-label="search" aria-describedby="search" required="required" name="searchString">
					</div>
				</form>
                </div>
                <c:import url="/main/signup.jsp" />
            </li>
            
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
            </li>
            <!-- /END Separator -->
            
            <!-- Menu with submenu -->        
            <a href="/notice/notice.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-bullhorn fa-fw mr-3"></span>
                    <span class="menu-collapsed">공지사항</span>    
                </div>
            </a>
            <a href="/question/Q&A.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-question-circle fa-fw mr-3"></span>
                    <span class="menu-collapsed">Q&A</span>    
                </div>
            </a>
            <a href="/recruit/recruit.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-users fa-fw mr-3"></span>
                    <span class="menu-collapsed">구인구직</span>    
                </div>
            </a>
            <a href="/Freeboard/free.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-comments fa-fw mr-3"></span>
                    <span class="menu-collapsed">자유게시판</span>    
                </div>
            </a>
            <a href="/tech/tech.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-laptop fa-fw mr-3"></span>
                    <span class="menu-collapsed">기술동향</span>    
                </div>
            </a>
           
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
<!--                 <small>OPTIONS</small> -->
            </li>
            <!-- /END Separator -->
             <a href="/project/project.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-project-diagram fa-fw mr-3"></span>
                    <span class="menu-collapsed">프로젝트</span>    
                </div>
            </a>
            <a href="/code/code.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-code fa-fw mr-3"></span>
                    <span class="menu-collapsed">코드</span>    
                </div>
            </a>

            <!-- Separator without title -->
            <li class="list-group-item sidebar-separator menu-collapsed"></li>            
            <!-- /END Separator -->
            <c:if test="${'관리자' eq sessionScope.userNick }" >
             <a href="/admin/userinfoadmin.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-wrench fa-fw mr-3"></span>
                    <span class="menu-collapsed">회원관리</span>
                </div>
            </a>
            <a href="/admin/statistics.do" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-wrench fa-fw mr-3"></span>
                    <span class="menu-collapsed">통계관리</span>
                </div>
            </a>
            </c:if>
            
            <a href="#" data-toggle="sidebar-colapse" class="bg-warning list-group-item list-group-item-action d-flex align-items-center">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span id="collapse-icon" class="fa fa-2x mr-3"></span>
                    <span id="collapse-text" class="menu-collapsed">Collapse</span>
                </div>
            </a>
        </ul><!-- List Group END-->
    </div><!-- sidebar-container END -->

    <!-- MAIN -->
    <div class="col">
    