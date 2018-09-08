<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->

  <title>INTRO</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial;
    font-size: 30px;
}

#myVideo {
    position: fixed;
    right: 0;
    bottom: 0;
    width: 1600px; 
    height: 900px;
}

.content {
    position: fixed;
    top: 10px;
    left: 30px;
    background: rgba(0, 0, 0, 0.01);
    color: yellow;
    width: 300px;
    height: 120px;
    padding: 1;
}

.icon {
	position: fixed;
	bottom: 10px;
	right: 10px;
	background: rgba(0, 0, 0, 0.01);
	width: 80px;
	height: 70px;
	padding: 1;
}

</style>
</head>

<body>

 <!-- The video -->
<video autoplay muted loop id="myVideo">
  <source src="intro.mp4" type="video/mp4">
</video>

<div class="content">
	<h1>Dokky</h1>
</div>

<div class="icon">
	<a href="/main/main.do"><img src='../img/logo1.png' width="70" height="50" alt="logo" /></a> 
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
            	response.sendRedirect("/main/main.do");
            }
        }  
    }
     	
%>

</body>
</html>