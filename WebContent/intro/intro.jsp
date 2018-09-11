<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Dokky</title>
    
    <link href=" https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet"> 
	<link href="https://getbootstrap.com/docs/4.0/examples/carousel/carousel.css" rel="stylesheet"> 	
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    
<style type="text/css">
	#myVideo {
		position: fixed;
		right: 0;
		bottom: 0;
	}
	
	p {
		color: white;
		font-size: 20px;
	}
		
	h1 {
		color: orange;
	}
		
	h3 {
		color: orange;
	}
		
.img-fluid.max-width: 100%;
		
    </style>
</head>
<body>

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-warning justify-content-between">
        <div><a class="navbar-brand h3" href="/main/main.do">Dokky</a></div>
<!--         <a class="btn btn-success" href="/main/signup.do">회원가입</a> -->
        <div><a class="btn btn-success" href="/main/signin.do">로그인</a></div>
     
      </nav>
    </header>
    <video autoplay muted loop id="myVideo">
	  <source src="intro.mp4" type="video/mp4">
	</video>
	
	<div class="container mt-5">
		<div class="row">
			<div class="col-12 my-2" style="text-align: center;">
		   		<img src='../img/logo1.png' width="120" height="60" alt="logo" />
		    	<h1 style="margin-top: 30px; margin-bottom: 30px;">개발자를 위한 커뮤니티 사이트</h1>
		   		<div>
			    	<a class="btn btn-warning" href="/main/main.do">
			        	Dokky 시작하기
			        </a>
		    	</div>	
		    </div>
	    </div>
        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-6">
            <h1>자유게시판</h1>
            <p>  </p>
          </div>
          <div class="col-md-6">
            <img src="../img/freeboard.PNG" class="img-fluid" alt="Responsive image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-6 order-md-2">
            <h1>프로젝트</h1>
            <p>  </p>
          </div>
          <div class="col-md-6 order-md-1">
           	<img src="../img/project.PNG" class="img-fluid" alt="Responsive image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-6">
            <h1>코드</h1>
            <p>
				나만의 소스코드관리 Kit!<br>
				소스코드에 @kit 테그만 추가해 주세요.<br> 
				손쉽게 소스코드를 관리 할 수 있습니다.  
			</p>
          </div>
          <div class="col-md-6">
            <img src="../img/code.PNG" class="img-fluid" alt="Responsive image">
          </div>
        </div>

        <hr class="featurette-divider">
        
         <!-- 프로필 소개 -->
        <div class="row">
          <div class="col-12 my-4" style="text-align: center;">		
		 	<h1>조원 프로필</h1>       
		  </div>	  
          <div class="col-lg-4">
            <img class="rounded-circle" src="../img/유승리.jpg" alt="Generic placeholder image" width="120" height="120">
            <h3>유승리</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	Intro페이지, Q&A, 공지사항 게시판 작업<br>
            	<br>
            	<a href="mailto:yuseungri10@naver.com">
            	<img src="http://www.cnplugins.com/uploads/crximage/201511/www.cnplugins.com_gobamlfhmmmpbeiolmgeoebfciogcpoa_logo.jpg" width="40" height="40"/>
            	</a>
            </p>
   
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="../img/정지훈.jpg" alt="Generic placeholder image" width="120" height="120">
            <h3>정지훈</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	Intro페이지, Q&A, 코드 게시판 작업<br>
            	<br>
            	<a href="mailto:jihoonys82@gmail.com">
            	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" width="30" height="30"/>
            	</a>
            </p>
            
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="../img/안희민.png" alt="Generic placeholder image" width="120" height="120">
            <h3>안희민</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	Intro페이지, Q&A, 공지사항 게시판 작업<br>
            	<br>
            	<a href="mailto:sindy6639@naver.com">
            	<img src="http://www.cnplugins.com/uploads/crximage/201511/www.cnplugins.com_gobamlfhmmmpbeiolmgeoebfciogcpoa_logo.jpg" width="40" height="40"/>
            	</a>
            </p>
      
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="../img/한상근.jpg" alt="Generic placeholder image" width="120" height="120">
            <h3>한상근</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	Intro페이지, Q&A, 공지사항 게시판 작업<br>
            	자바를 배우고싶은 한상근입니다. 잘부탁드립니다<br>
            	<a href="mailto:han92866@gmail.com">
            	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" width="30" height="30"/>
            	</a>
            </p>
         
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="../img/배창환.jpg" alt="Generic placeholder image" width="120" height="120">
            <h3>배창환</h3>
            <p> 
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	Intro페이지, Q&A, 공지사항 게시판 작업<br>
            	프론트 너무 어렵습니다<br>
            	<a href="mailto:sindy6639@naver.com">
            	<img src="http://www.cnplugins.com/uploads/crximage/201511/www.cnplugins.com_gobamlfhmmmpbeiolmgeoebfciogcpoa_logo.jpg" width="40" height="40"/>
            	</a>
            </p>
      
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="../img/권미현.jpg" alt="Generic placeholder image" width="120" height="120">
            <h3>권미현</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	Intro페이지, Q&A, 공지사항 게시판 작업<br>
				<br>
				<a href="mailto:sindy6639@naver.com">
            	<img src="http://www.cnplugins.com/uploads/crximage/201511/www.cnplugins.com_gobamlfhmmmpbeiolmgeoebfciogcpoa_logo.jpg" width="40" height="40"/>
            	</a>
            </p>
           
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->

        <!-- /END THE FEATURETTES -->
	</div>

      <!-- FOOTER -->
      <div class="containter">
	      	<div class="col-12" style="text-align: center;">
				<p> @2018 Dokky by KHInformation <a href="https://github.com/jihoonys82/JavaSemiProject_Work">
				<i class="fab fa-github fa-3x"></i></a></p>
				<p class="float-right">
					<a href="#"><i class="fas fa-angle-double-up fa-3x"></i></a>
				</p>
	      	</div>
      </div>
      
<%
 	Cookie enter = new Cookie("id", "enter");    // 쿠키를 생성한다. 이름:Cookie, 값 : enter
 	enter.setMaxAge(60*60);                      // 쿠키의 유효기간을 1시간으로 설정한다.
 	response.addCookie(enter);                   // 클라이언트 응답에 쿠키를 추가한다.
	
 	// 쿠키값 가져오기
     Cookie[] cookies = request.getCookies() ;
     
     if(cookies != null){
         for(int i=0; i < cookies.length; i++){
             Cookie c = cookies[i] ;
             // 저장된 쿠키 이름을 가져온다
             String cName = c.getName();
             // 쿠키값을 가져온다
             String cValue = c.getValue();
             if( cName.equals("id") && cValue.equals("enter") ) {
//               	response.sendRedirect("/main/main.do");
             }
         }  
     }
%> 
         
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<!--     <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script> -->
    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/popper.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/holder.min.js"></script>
    
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/holder.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>
   
  </body>
</html>
  
    