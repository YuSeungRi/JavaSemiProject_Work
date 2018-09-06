<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1091632171759-s4kamvpr1bdrdv7oe1b5n1qjsjouo8cp.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
</head>

<body>
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    
    <form id="google" action="/main/signin.do" method="post">
		<input id="userEmailG" name="userEmail" type="text" hidden="true" />
		<input id="userNickG" name="userNick" type="text" hidden="true" />
		<input id="userPhotoG" name="userPhoto" type="text" hidden="true" />
		<input id="loginTypeG" name="loginType" type="text" hidden="true" value="social" />
		<button type="submit" hidden="true">submit</button>
	</form>
	
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        
	    var email = profile.getEmail();
	    var nick = profile.getName();
	    var photoPath = profile.getImageUrl();
       
	    document.getElementById("userEmailG").value = email;
	    document.getElementById("userNickG").value = nick;
	    document.getElementById("userPhotoG").value = photoPath;
	    document.getElementById("loginTypeG").value = "social";
	    
	    document.getElementById("google").submit();
       
      };
    </script>
</body>
  
</html>