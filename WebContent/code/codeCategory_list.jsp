<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="list-group wrapper-scroll-y">
	<div class="list-group-item list-group-item-secondary d-flex justify-content-between align-items-center"><h5>Category</h5>
		<button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#addCategory">추가</button>
	</div>
	<div class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" onclick="viewList(0)">
		All
		<span class="badge badge-primary badge-pill">${allCount }</span>
	</div>
	<c:forEach items="${allCategory}" var="category">
		<div onclick="viewList(${category.categoryNo })" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" >
			<div>${category.categoryName }<span class="badge badge-primary badge-pill ml-2">${category.categoryCount }</span></div>
			<button onclick="deleteCategory(${category.categoryNo},${category.categoryCount })" name="${category.categoryNo }" class="btn btn-sm btn-transparent"><span>&times;</span></button>
		</div>
	</c:forEach>
</div><!-- end of list-group -->