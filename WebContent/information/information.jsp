<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp"%>
<style>

.filebox label {
  display: inline-block;
  padding: .4em .55em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}
#img-upload{
    width: 100%;
}
</style>
<div class="container m-3">
	<h1>
		<span class="fas fa-address-card fa-fw mr-1"></span>회원정보수정
	</h1>
	<form action="/information/info.do" method="post" enctype="multipart/form-data" >
		<div class="row justify-content-center">
			<div class="col-lg-6 col-11 my-3">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="Email">이메일</label>
					<div class="col-sm-3">${sessionScope.userId }</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNickname">닉네임</label>
					<div class="col-sm-4">
						<input class="form-control" name="changeUserNick" type="text"
							value="${requestScope.userinfo.userNick }" pattern="(?=.*[가-힣a-zA-Z]).{2,}"  title="닉네임은 2글자 이상 입력해주세요." required>
						<small id="inputNickname" class="text-muted">닉네임은 2~10자 이내</small>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="Grade">등급</label>
					<div class="col-sm-6">${requestScope.userinfo.userLevel }</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="Joindate">가입일</label>
					<div class="col-sm-3">${requestScope.userinfo.userRegistDate }</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호 변경</label>
					<div class="col-sm-7">
						<input class="form-control" name="changepwd" id="my-password" type="password"
							value=${requestScope.userinfo.userPw } 
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
							title="패스워드는 6자 이상에 영어대소문자, 숫자를 포함해서 입력해주세요." required> 
							<small id="inputPassword" class="text-muted">패스워드는 영어대소문자, 숫자를 포함 6자 이상</small>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">자기소개</label>
					<div class="col-sm-7">
						<textarea name="intro" cols="50" rows="4">${requestScope.userinfo.userIntro }</textarea>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-8 text-center">
				<img class ="img-thumbnail img-fluid rounded float-left mb-3"
 						src="/upload/${requestScope.userinfo.userPhoto }" id='img-upload' 
 						style="width:350px; height:450px;"/>
				<div class="filebox bs3-primary">
					<label for="file">파일선택</label> 
					<input type="file" id="file" value="${requestScope.userinfo.userPhoto }" name="file">
				</div>
			</div>
		</div>
		<div>
			<div class="col-sm-12 text-center">
				<button class="btn btn-primary mt-3" type="submit">
					수정완료<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
		</div>
	</form>
</div>
<%@include file="../main/scriptloader.jsp"%>
<script>
$(document).ready( function() {
	$(document).on('change', '.btn-file :file', function() {
	var input = $(this),
		label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	input.trigger('fileselect', [label]);
	});

	$('.btn-file :file').on('fileselect', function(event, label) {
	    
	    var input = $(this).parents('.input-group').find(':text'),
	        log = label;
	    if( input.length ) {
	        input.val(log);
	    } else {
	        if( log ) alert(log);
	    }
    
	});
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {
	            $('#img-upload').attr('src', e.target.result);
// 	            console.log(e.target.result);
	        }
	        
	        reader.readAsDataURL(input.files[0]);
// 	        console.log(input.files[0]);
	    }
	}

	$("#file").change(function(){
	    readURL(this);
	}); 	
});
</script>
<%@include file="../main/footer.jsp"%>