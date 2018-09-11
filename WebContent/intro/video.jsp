<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://fonts.googleapis.com/css?family=Indie+Flower|Londrina+Outline|Open+Sans+Condensed:300" rel="stylesheet">
     
  <!-- PAGE settings -->

  <title>INTRO</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: 'Open Sans Condensed', sans-serif;
}

h1 {
	margin: 1px;
}

p {
	color: blue;
	width: 300px;
	font-size: 10px;
}

#myVideo {
    position: fixed;
    right: 0;
    bottom: 0;
    width: 1600px; 
    height: 900px;
}

#name {
   float: left;
   top: 0;
   width: 300px;
   height: 60px;
   color: yellow;
   font-size: 30px;
}

#intro {
	float:left;
	top: 150px;
	width: 300px;
	height: 300px;
	padding: 5px;
}

.content {
	position: fixed;
    background: rgba(0, 0, 0, 0);
    width: 300px;
    height: 50%;
    padding: 1;
   
}

#icon {
	float: right;
	width: 60px;
	height: 40px;
}

.foot {
	position: fixed;
	bottom: 1px;
	background: rgba(0, 0, 0, 0.3);
	width: 100%;
	height: 150px;
	padding: 1;

}



</style>
</head>

<body>

 <!-- The video -->
<video autoplay muted loop id="myVideo">
  <source src="intro.mp4" type="video/mp4">
</video>

<%-- content --%>

<div class="content">
	
		<div id="name">
			<h1>Dokky</h1>
		</div>
		
		<div id="intro">
			<p>
		   	  pppppppppppppppppppppppppppppppppppppppp
		   	  pppppppppppppppppppppppppppppppppppppppp
		    </p>
    	</div>
</div>


<%-- footer --%>

<div class="foot">
	
	

	<div id="icon">
		<a href="/main/main.do"><img src='../img/logo1.png' width="60" height="40" alt="logo" /></a>
	</div>
</div>

<%

 	Cookie enter = new Cookie("id", "enter");    // 쿠키를 생성한다. 이름:Cookie, 값 : enter

 	enter.setMaxAge(60*60);                       // 쿠키의 유효기간을 1시간으로 설정한다.

 	response.addCookie(enter);                       // 클라이언트 응답에 쿠키를 추가한다.
	
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
//              	response.sendRedirect("/main/main.do");
             }
         }  
     }
%> 

</body>
</html>