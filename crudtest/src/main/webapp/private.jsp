<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인 후 접근가능
	if(session.getAttribute("loginId") == null) { // 본인 세션에 loginId를 만든적이 없다 -> 로그인 없다
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}

	String memberId = (String)(session.getAttribute("loginId"));
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
	<div class="container">
		<h1><%=memberId%>님 반갑습니다.</h1>
		<br><br>
		<a href="<%=request.getContextPath()%>/memberOne.jsp"
		class="btn btn-info">회원정보</a>
		&nbsp;&nbsp;
		<a href="<%=request.getContextPath()%>/logoutAction.jsp"
		class="btn btn-danger">로그아웃</a>
		<br>
	</div>
</body>
</html>