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
<!-- 	<link href="https://getbootstrap.com/docs/4.0/examples/carousel/carousel.css" rel="stylesheet"> 	 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    
<style type="text/css">
	#myVideo {
		position: fixed;
		right: 0;
		bottom: 0;
	}
	
	.col-lg-4 , .col-md-6  {
		padding: 0;
		margin: 0;
	}
	
	p {
		color: white;
		font-size: 16px;
	}
		
	h1, h3 {
		color: orange;
	}
			
	img { 
		max-width:100%; 
	}
	
	#top {
	  display: none;
	  position: fixed;
	  bottom: 10px;
	  right: 20px;
	  color: yellow;
	}
		
    </style>
</head>
<body>

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-warning justify-content-between">
        <div><a class="navbar-brand h3" href="/main/main.do">Dokky</a></div>
        <div><a class="btn btn-success mr-2" href="/main/main.do">시작하기</a>
        <a class="btn btn-success" href="/main/signin.do">로그인</a></div>
     
      </nav>
    </header>
    <video autoplay muted loop id="myVideo">
	  <source src="intro.mp4" type="video/mp4">
	</video>
	
	<!--  top spacing  -->
	<div style="height:4em;"></div>
	
	<div class="container my-5">
		<div class="row my-5">
			<div class="col-12" style="text-align: center;">
		   		<img src='../img/logo1.png' width="120" height="60" alt="logo" />
		    	<h1 style="margin-top: 30px; margin-bottom: 30px;">개발자를 위한 커뮤니티 사이트</h1>
		   		<div class="my-3">
			    	<a class="btn btn-warning" href="/main/main.do">
			        	Dokky 시작하기
			        </a>
		    	</div>	
		    </div>
	    </div>


        <div class="row my-5">
          <div class="col-md-6 text-md-right mt-5">
            <h1>자유게시판</h1>
            <p>  
            	개발자들이 서로 소통할 수 있는 <br>
            	공간입니다. 글 내용에 대한 제한없이<br>
            	다양한 주제로 대화할 수 있습니다. 
            </p>
          </div>
          <div class="col-md-6 my-5">
            <img src="../img/freeboard.PNG" class="img-fluid" alt="Responsive image">
          </div>
        </div>

        <div class="row my-5">
          <div class="col-md-6 order-md-2 mt-5">
            <h1>프로젝트</h1>
            <p>  
            	개발자의 역량 강화를 위하여 프로젝트를<br> 
            	모집할 수 있는 게시판 입니다.<br> 
            	지역과 사용기술 등을 선택하여<br>
            	다른사람과 함께 프로젝트를 진행할 수 있습니다.
            </p>
          </div>
          <div class="col-md-6 order-md-1 my-5">
           	<img src="../img/project.PNG" class="img-fluid" alt="Responsive image">
          </div>
        </div>

        <div class="row my-5">
          <div class="col-md-6 text-md-right mt-5">
            <h1>코드</h1>
            <p>
				나만의 소스코드관리 Kit!<br>
				소스코드에 @kit 테그만 추가해 주세요.<br> 
				손쉽게 소스코드를 관리 할 수 있습니다.  
			</p>
          </div>
          <div class="col-md-6 my-5">
            <img src="../img/code.PNG" class="img-fluid" alt="Responsive image">
          </div>
        </div>
        
         <!-- 프로필 소개 -->
        <div class="row text-center">
          <div class="col-12 my-5">		
		 	<h1>OkkyDokky 프로필</h1>       
		  </div>	  
          <div class="col-lg-4 col-md-6 my-5">
            <img class="rounded-circle" src="../img/유승리.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>유승리</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	프로젝트 게시판, 자유게시판 추천수, 조회수<br><br>
            	이번 프로젝트의 조장을 맡은 유승리 입니다!<br> 
				프로젝트에서 배운점을 바탕으로 발전하는<br>
				개발자가 되고싶습니다 화이팅!<br>
            	<a href="mailto:yuseungri10@gmail.com">
            	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" width="30" height="30"/>
            	</a>
            </p>
   
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4 col-md-6 my-5">
            <img class="rounded-circle" src="../img/정지훈.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>정지훈</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	프로토 타입 제작 , DB 설계, 코드 게시판,<br> 첨부파일 기능<br><br>
            	살려줘<br>
            	<a href="mailto:jihoonys82@gmail.com">
            	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" width="30" height="30"/>
            	</a>
            </p>
            
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4 col-md-6 my-5">
            <img class="rounded-circle" src="../img/안희민.png" alt="Generic placeholder image" width="140" height="140">
            <h3>안희민</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	전체검색 기능, 게시판별 검색기능, 기술동향 게시판, 페이지네이션<br><br>
            	프로젝트의 조원으로 참여한 안희민입니다 <br>
            	이번 프로젝트로 인해 많은걸 배울 수 있었고,<br>
            	부족한 부분을 많이 알 수 있었습니다.<br>
            	이 경험을 반면교사 삼아 더욱 노력하도록 하겠습니다.<br>
            	<a href="mailto:gmlals031@gmail.com">
            	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" width="30" height="30"/>
            	</a>
            </p>
      
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4 col-md-6 my-5">
            <img class="rounded-circle" src="../img/한상근.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>한상근</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	세션로그인, 마이페이지, 회원정보수정, 회원관리,<br> 회원가입 <br><br>
            	안녕하세요 오키도키 조원 한상근입니다.<br> 
            	이번 프로젝트를 통해서 많은것을 배울수 있어서<br>
            	 참 좋았습니다. 앞으로도 노력하여 좋은<br>
            	 웹 개발자가 되도록 하겠습니다.<br>
            	<a href="mailto:han92866@gmail.com">
            	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" width="30" height="30"/>
            	</a>
            </p>
         
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4 col-md-6 my-5">
            <img class="rounded-circle" src="../img/배창환.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>배창환</h3>
            <p> 
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	intro페이지, 소셜로그인, Q&A, 공지사항, 자유게시판 상세보기 <br><br>
            	이번 프로젝트에 참가한 조원 배창환 입니다.<br>
            	프론트 쪽으로는 아는것이 거의 없었는데<br>
            	이번에 많이 알게되서 좋은 경험이 되었습니<br>
            	<a href="mailto:sindy6639@naver.com">
            	<img src="http://www.cnplugins.com/uploads/crximage/201511/www.cnplugins.com_gobamlfhmmmpbeiolmgeoebfciogcpoa_logo.jpg" width="40" height="40"/>
            	</a>
            </p>
      
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4 col-md-6 my-5">
            <img class="rounded-circle" src="../img/권미현.jpg" alt="Generic placeholder image" width="140" height="140">
            <h3>권미현</h3>
            <p>  
            	웹개발 응용SW 엔지니어 양성과정 12회차<br>
            	구인구직 게시판, 통계페이지, 자유게시판 작성기능, 댓글 기능 <br><br>
				프로젝트에 참가한 권미현입니다.<br>
				이번 프로젝트를 통해서 여러 기술들을 알고 배울 수 있었습니다.<br>
				배운 기술들을 통해서 더욱 많이 배우고 나아갈 수 있도록 하겠습니다.<br>
				<a href="mailto:mihyun.kwon96@gmail.com">
            	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" width="30" height="30"/>
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
					<a id="top" href="#"><i class="fas fa-angle-double-up fa-3x"></i></a>
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
    
    <!-- scroll set -->
   <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script>
   window.onscroll = function() {scrollFunction()};

   function scrollFunction() {
       if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
           document.getElementById("top").style.display = "block";
       } else {
           document.getElementById("top").style.display = "none";
       }
   }
   
   $(document).ready(function(){
	   $('#top').click(function(){
		    $("html, body").animate({ scrollTop: 0 }, 600);
		    return false;
		});
	 });
	   
   </script>
   
  </body>
</html>
  
    