<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 댓글 입력 -->
<form action="/reply/reply.do" method="post" class="form-inline">
  <div class="form-group">
    <label for="userEmail">작성자</label>
    <input type="email" class="form-control" id="userEmail" name="userEmail" value="${sessionScope.userEmail }" readonly />
  </div>
  <div class="form-group">
    <label for="boardNo">글번호</label>
    <input type="text" class="form-control" id="boardNo" name="boardNo" value="${param.boardNo }" readonly>
  </div>
  <div class="form-group form-check">
    <textarea rows="5" class="form-control" id="replyContent" name="replyContent" placeholder="댓글을 입력해주세요."></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

<!-- 댓글 목록 -->
<div class="list-group">
	<c:forEach items="${replyList }" var="reply">
	<div class="d-flex w-100 justify-contents-between">
		<small>번호:${reply.replyNo }, 작성자:${reply.userEmail }, 작성일:${replyCreate }</small><button id="btnReplyDelete" type="button">댓글삭제</button>
		<p class="mb-1">${reply.replyContent }</p>
	</div>
	</c:forEach>
</div>