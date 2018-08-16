<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="../css/SideMenu.css" />

    <!-- Summernote_start -->
<link rel="stylesheet" href="../summernote/summernote-bs4.css" />

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../summernote/summernote-bs4.min.js"></script>
<!-- Summernote_end -->
</head>
<body>

<!-- Bootstrap NavBar -->
<nav class="navbar navbar-expand-md bg-warning d-md-none">
  <button class="navbar-toggler navbar-toggler-right bg-white" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon fa fa-star text-warning pt-1"></span> 
  </button>
  <a class="navbar-brand" href="#">
    <img src="../img/logo1.png" width="90" height="40" alt="logo" class="d-inline-block align-top">
  </a>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav navbar-hover ">
      <!-- This menu is hidden in bigger devices with d-sm-none. 
           The sidebar isn't proper for smaller screens imo, so this dropdown menu can keep all the useful sidebar itens exclusively for smaller screens  -->
      <li class="nav-item dropdown d-sm-block d-md-none">
			<a class="dropdown-item" href="#">홈</a>
            <a class="dropdown-item" href="#">공지사항</a>
            <a class="dropdown-item" href="#">Q & A </a>
            <a class="dropdown-item" href="#">구인구직</a>
            <a class="dropdown-item" href="#">자유게시판</a>
            <a class="dropdown-item" href="#">기술동향</a>
            <a class="dropdown-item" href="#">프로젝트</a>
            <hr>
            <a class="dropdown-item" href="#">교육자료</a>
            <hr>
            <a class="dropdown-item" href="#">코드</a>
            <hr>
            <a class="dropdown-item" href="#">마이페이지</a>
            <a class="dropdown-item" href="#">관리자게시판</a>
      </li><!-- Smaller devices menu END -->
      
    </ul>
  </div>
</nav><!-- NavBar END -->


<!-- Bootstrap row -->
<div class="row" id="body-row">
    <!-- Sidebar -->
    <div id="sidebar-container" class="sidebar-expanded d-none d-md-block bg-warning"><!-- d-* hiddens the Sidebar in smaller devices. Its itens can be kept on the Navbar 'Menu' -->
        <!-- Bootstrap List Group -->
        <ul class="list-group">
        	<!-- Logo -->
            <li class="bg-warning list-group-item logo-separator d-flex justify-content-center pb-5">
                <img src='../img/logo1.png' width="70" height="40" alt="logo" />    
            </li>   
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
                <small></small>
            </li>
            <!-- /END Separator -->
            
            <li class="list-group-item list-group-item-action menu-collapsed bg-warning">
                <div class="d-flex flex-row w-100 justify-content-center ">
	                <div class="input-group input-group-sm mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text fa fa-search" id="basic-addon1"></span>
					  </div>
					  <input type="text" class="form-control" placeholder="검색" aria-label="search" aria-describedby="search">
					</div>
                </div>
                <%@include file="./signup.jsp" %>
<!--                 <div class="d-flex flex-row w-100 justify-content-center "> -->
<!-- 	                <button class="btn btn-sm bg-success text-light mr-1"><span class="fa fa-sign-in-alt fa-fw mr-1"></span><span class="menu-collapsed">로그인</span></button> -->
<!-- 	                <button class="btn btn-sm bg-secondary text-light"><span class="fa fa-user-plus fa-fw mr-1"></span><span class="menu-collapsed">회원가입</span></button> -->
<!--                 </div> -->
            </li>
            
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
<!--                 <small>OPTIONS</small> -->
            </li>
            <!-- /END Separator -->
            
            <!-- Menu with submenu -->        
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-bullhorn fa-fw mr-3"></span>
                    <span class="menu-collapsed">공지사항</span>    
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-question-circle fa-fw mr-3"></span>
                    <span class="menu-collapsed">Q&A</span>    
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-users fa-fw mr-3"></span>
                    <span class="menu-collapsed">구인구직</span>    
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-comments fa-fw mr-3"></span>
                    <span class="menu-collapsed">자유게시판</span>    
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-laptop fa-fw mr-3"></span>
                    <span class="menu-collapsed">기술동향</span>    
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-project-diagram fa-fw mr-3"></span>
                    <span class="menu-collapsed">프로젝트</span>    
                </div>
            </a>
            <!-- Separator with title -->
            <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
<!--                 <small>OPTIONS</small> -->
            </li>
            <!-- /END Separator -->
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-graduation-cap fa-fw mr-3"></span>
                    <span class="menu-collapsed">교육자료</span>    
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-code fa-fw mr-3"></span>
                    <span class="menu-collapsed">코드</span>    
                </div>
            </a>

            <!-- Separator without title -->
            <li class="list-group-item sidebar-separator menu-collapsed"></li>            
            <!-- /END Separator -->
             <a href="#" class="list-group-item list-group-item-action bg-warning">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="fa fa-wrench fa-fw mr-3"></span>
                    <span class="menu-collapsed">관리자페이지</span>
                </div>
            </a>
            
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
