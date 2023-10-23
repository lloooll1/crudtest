<!-- updateMemberPwForm -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	<form action="<%=request.getContextPath()%>/updateMemberPwAction.jsp">	<!-- 비밀번호 수정값 전송 form -->
	<table border="1">
	<tr>
		<td>아이디</td>
		<td><%=loginId%></td>
	</tr>
	<tr>
		<td>원래 비밀번호</td>
		
		<td><input type="password" name="pw"></td> <!-- updatePw로 전송 -->
	</tr>
	
	<tr>
		<td>새로운비밀번호</td>
		
		<td><input type="password" name="updatePw"></td> <!-- updatePw로 전송 -->
	</tr>
	
	
	</table>
	<button type="submit">수정</button>
	</form>
</body>
</html>