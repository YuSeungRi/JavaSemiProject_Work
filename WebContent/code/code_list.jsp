<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover table-bordered table-sm table-striped ">	
 	<thead class="fixedHeader">
		<tr >
			<th>#</th>
			<th hidden="true">
			<th>Title</th>
			<th>Language</th>
<!-- 			<th>Tech</th> -->
			<th>Content</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<% int idx=0; %>
		<c:forEach items="${codeList }" var="code">
			<tr onclick="viewDetail(${code.codeNo});">
				<td><%=++idx %></td>
				<td hidden="true">${code.codeNo }</td>
				<td>${code.codeTitle }</td>
				<td>${code.language }</td>
<!-- 				<td> -->
<%-- 					<c:set var="items" value="${code.tech }" /> --%>
<%-- 					<%if(pageContext.getAttribute("items") instanceof ArrayList<?>){ --%> 
<%--// 						ArrayList<?> arrStr = (ArrayList<?>)pageContext.getAttribute("items"); --%> 
<%-- 						for(Object tech: arrStr) {%> --%>
<%-- 							<span class="badge badge-primary"><%=tech %></span> --%>
<%-- 					<%	}  --%>
<%-- 					}%> --%>
<!-- 				</td> -->
				<td>${code.codeContent}</td>
				<td class="text-center"><button onclick="deleteCode(${code.codeNo},${code.categoryNo })" name="${code.codeNo}" class="btn btn-sm btn-transparent"><span>&times;</span></button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>