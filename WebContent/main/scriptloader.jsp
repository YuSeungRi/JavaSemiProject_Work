<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	</div><!-- Main Col END -->
    
</div><!-- body-row END -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="../js/sidemenu.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#passwordChecker').on('change',function(){
    var isChecked = $(this).prop('checked');
    if (isChecked) {
      $('#my-password').attr('type','text');
    } else {
      $('#my-password').attr('type','Password');
    }
  });
  
  <c:if test="${sessionScope.login ne true}">
  $("a[href='/code/code.do']").attr("href", "#").attr("onclick", "alert('로그인 후 사용하실 수 있습니다.')");
  </c:if>
  
});
      
</script>