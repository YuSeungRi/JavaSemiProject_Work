<%@page import="dto.ReplyDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 댓글 목록 -->
<div class="list-group">
	<% ArrayList<ReplyDto> dtos = (ArrayList<ReplyDto>)request.getAttribute("replyList"); %>
	<% for(ReplyDto dto : dtos) { %>
	<div class="d-flex w-100 justify-contents-between">
		<small>댓글번호:<%=dto.getReplyNo() %>, 작성자:<%=dto.getUserEmail() %>, 작성일:<%=dto.getReplyCreate() %></small><button id="btnReplyDelete" type="button" name="<%=dto.getReplyNo()%>">댓글삭제</button>
		<p class="mb-1"><%=dto.getReplyContent() %></p>
	</div>
	<% } %>
</div>