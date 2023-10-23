<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인 후 접근가능
	if(session.getAttribute("loginId") == null) { // 본인 세션에 loginId를 만든적이 없다 -> 로그인 없다
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}

	String memberId = (String)(session.getAttribute("loginId"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=memberId%>님 반갑습니다.
	<a href="<%=request.getContextPath()%>/logoutAction.jsp">로그아웃</a>
	<br>
	<a href="<%=request.getContextPath()%>/memberOne.jsp">회원정보</a>
</body>
</html>