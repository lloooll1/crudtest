<!-- insertMember -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="<%=request.getContextPath()%>/insertMemberAction.jsp"> <!-- from으로 데이터 전송 -->
	<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="insertId"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="insertPw"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="insertPwCh"></td>
	</tr>
	
	<tr>
		<td>이름</td>
		<td><input type="text" name="insertName" ></td>
	</tr>
	</table>
	<button type="submit">회원가입</button>
	</form>
</body>
</html>