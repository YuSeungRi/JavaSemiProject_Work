<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp" %>
<link rel="stylesheet" href="../css/Main.css" />
<%@include file="../main/styleloader.jsp" %>
<div class="container m-3">
    <h2>
		<i class="far fa-object-group"></i> 프로젝트
	</h2>
			 
	 <br><br>
    
    <div class="col-md-12">
	<div class="card">
	  <div class="card-header">
	    프로젝트 검색하기
	  </div>
	  
	<div class="card-body">
    <form>
    
	  <div class="form-group row">
	    <label for="projectName" class="col-sm-2 col-form-label">프로젝트 명</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="projectName" placeholder="프로젝트명을 입력하세요">
	    </div>
	  </div>	  
	  	  
	  <div class="form-group row">
	    <div class="col-sm-2">지역</div>
	    <div class="col-sm-10">
	 	<select class="custom-select">
		  <option selected>지역을 선택하세요</option>
			<option value="1" >서울</option>											
			<option value="2" >부산</option>											
			<option value="3" >대구</option>											
			<option value="4" >인천</option>											
			<option value="5" >광주</option>											
			<option value="6" >대전</option>											
			<option value="7" >울산</option>											
			<option value="8" >세종</option>											
			<option value="9" >경기</option>											
			<option value="10" >강원</option>											
			<option value="11" >충청</option>											
			<option value="13" >전라</option>											
			<option value="14" >경상</option>	
			<option value="15" >제주</option>
		</select>
	    </div>
	  </div>	  

	  <div class="form-group row">
	    <div class="col-sm-2">사용기술</div>
	    <div class="col-sm-10">
	      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
			  <label class="form-check-label" for="inlineCheckbox1">java</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
			  <label class="form-check-label" for="inlineCheckbox2">c++</label>
			</div>
				      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
			  <label class="form-check-label" for="inlineCheckbox3">C#</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
			  <label class="form-check-label" for="inlineCheckbox4">javaScript</label>
			</div>
				      	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
			  <label class="form-check-label" for="inlineCheckbox5">CSS</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
			  <label class="form-check-label" for="inlineCheckbox6">HTML</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
			  <label class="form-check-label" for="inlineCheckbox7">Node.js</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option8">
			  <label class="form-check-label" for="inlineCheckbox8">Oracle</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option9">
			  <label class="form-check-label" for="inlineCheckbox9">MySQL</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option10">
			  <label class="form-check-label" for="inlineCheckbox10">JSP</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option11">
			  <label class="form-check-label" for="inlineCheckbox11">Python</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option12">
			  <label class="form-check-label" for="inlineCheckbox12">PHP</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option13">
			  <label class="form-check-label" for="inlineCheckbox13">기타</label>
			</div>
			
			
	    </div>
	  </div>
		
	  <div class="form-group row">
	    <div class="col-sm-2">사용기술</div>
		  
			<div class="form-group col-md-5">
			 <label >시작일</label>
			 <input type="date" name="bday" max="3000-12-31" 
			        min="1000-01-01" class="form-control">
			</div>
			
			<div class="form-group col-md-5">
			 <label >종료일</label>
			 <input type="date" name="bday" min="1000-01-01"
			        max="3000-12-31" class="form-control">
			</div>

	  </div>		
			  
	  <div class="form-group row justify-content-end">

	      <button type="submit" class="btn btn-primary btn-sm mx-2">검색하기</button>
	      <button type="reset" class="btn btn-default btn-sm mx-2">초기화</button>
	      
	  </div>
	  
	</form>
    </div>
    </div>
    </div>	
    
    <!-- 프로젝트 검색하기 작성완료 -->
    
    			<div class="col-md-12">

				<br>

				<form>
					<div>

						<ul class="nav">
							<li class="nav-item"><a class="nav-link" href="#">가나다</a></li>
							<li class="nav-item"><a class="nav-link" href="#">시작일</a></li>
							<li class="nav-item"><a class="nav-link" href="#">지역</a></li>
							<li class="nav-item"><a class="nav-link" href="#">모집상태</a></li>
						</ul>
					</div>
				</form>

				<div style="overflow: auto;" class="">
					<table class="table table-hover table-sm">
						<thead class="thead-light">
							<tr>
								<th>글번호</th>
								<th>작성일</th>
								<th>제목</th>
								<th>작성자</th>
								<th>모집상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집중</td>

							</tr>
							<tr>
								<td>2</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집완료</td>

							</tr>
							<tr>
								<td>3</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집완료</td>

							</tr>
							<tr>
								<td>4</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집중</td>

							</tr>
							<tr>
								<td>5</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집완료</td>

							</tr>
							<tr>
								<td>6</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집중</td>

							</tr>
							<tr>
								<td>7</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집중</td>
	
							</tr>
							<tr>
								<td>8</td>
								<td>2018-08-02</td>
								<td>놀러갑시다</td>
								<td>관리자</td>
								<td>모집중</td>
					
							</tr>
						</tbody>
					</table>
				</div>
				<br> <a href="#" class="btn btn-secondary btn-sm active"
					role="button" aria-pressed="true">프로젝트 등록하기</a> <br> <br>

				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">&laquo</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">6</a></li>
					<li class="page-item"><a class="page-link" href="#">7</a></li>
					<li class="page-item"><a class="page-link" href="#">8</a></li>
					<li class="page-item"><a class="page-link" href="#">9</a></li>
					<li class="page-item"><a class="page-link" href="#">10</a></li>
					<li class="page-item"><a class="page-link" href="#">&raquo</a></li>
				</ul>

			</div>
    
    
    
	
	<!-- 작성완료 -->	
	
</div>
<%@include file="../main/scriptloader.jsp" %>
<%@include file="../main/footer.jsp"%>