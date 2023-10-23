<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인 전
	if(session.getAttribute("loginId") != null) { // 로그인 되어 있으면
		response.sendRedirect(request.getContextPath()+"/private.jsp");
		return;
	}
	
	String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<%
		if(msg != null) {
	%>
			<div><%=msg%></div>		
	<%
		}
	%>
	<form method="post" action="<%=request.getContextPath()%>/loginAction.jsp">
		<table border="1">
			<tr>
				<th>memberId</th>
				<td><input type="text" name="memberId"></td>
			</tr>
			<tr>
				<th>memberPw</th>
				<td><input type="password" name="memberPw"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit">로그인</button>
					<a href="<%=request.getContextPath()%>/insertMember.jsp">회원가입</a>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>