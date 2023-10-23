<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인과 상관없이 접근 가능
%>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>public</h1>
	<div>
		contents....
	</div>
	<%
		if(session.getAttribute("loginId") == null) {
	%>
			<a href="<%=request.getContextPath()%>/insertMember.jsp">회원가입</a>
			<br>
			<a href="<%=request.getContextPath()%>/loginForm.jsp">로그인</a>
	<%		
		} else {
	%>
			<a href="<%=request.getContextPath()%>/private.jsp">private</a>
	<%	
		}
	%>
	
	
</body>
</html>