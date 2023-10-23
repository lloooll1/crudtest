<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<%    
	if(session.getAttribute("loginId") == null) { // 본인 세션에 loginId를 만든적이 없다 -> 로그인 없다
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}
	String loginId = (String)(session.getAttribute("loginId"));

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<form action="<%=request.getContextPath()%>/deleteMemberAction.jsp">	<!-- 비밀번호 수정값 전송 form -->
	<table border="1" class="table">
	<tr>
		<td>아이디</td>
		<td><%=loginId%></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		
		<td><input type="password" name="pw"></td> <!-- delete로 전송 -->
	</tr>

	
	
	</table>
	<h2>정말 삭제하시겠습니까?</h2>
	<button type="submit" class="btn btn-danger">삭제</button>
	</form>
	</div>
</body>
</html>