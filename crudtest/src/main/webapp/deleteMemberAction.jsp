<!-- deleteMemberForm  -->
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
	
	
	String loginId = (String)(session.getAttribute("loginId")); // 세션에서 아이디 가져오기
	String pw = request.getParameter("pw");
	System.out.println(loginId+"<------ 삭제중인 아이디");

	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/test";
	String dbuser = "root";
	String dbpw = "1234";
	Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
	
	String sql = "DELETE FROM member WHERE member_id =? AND member_pw=PASSWORD(?)";	// 아이디 확인 후 삭제
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1,loginId);
	stmt.setString(2,pw);
	
	int rowsUpdated = stmt.executeUpdate();
	System.out.println(rowsUpdated+"<------ 삭제 확인");
	if (rowsUpdated > 0) {
		// 업데이트가 성공한 경우
		System.out.println(loginId+"<------ 삭제완료 ");
		response.sendRedirect(request.getContextPath() + "/logoutAction.jsp"); // 로그아웃세션으로 이동
	} 
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>