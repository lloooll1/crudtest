<!-- insertMemberAction -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
String insertId = request.getParameter("insertId");		// form으로 id값 받기
String insertPw = request.getParameter("insertPw");		// form으로 pw값 받기
String insertName = request.getParameter("insertName");	// form으로 이름값 받기

Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://localhost:3306/test" ;
String dbuser = "root";
String dbpw = "1234";
Connection conn = DriverManager.getConnection(url, dbuser, dbpw);

// sql문으로 id pw 이름 값 INSERT하기 (회원가입)
String sql = "INSERT INTO member(member_id, member_pw, member_name, createdate, updatedate) VALUES(? , PASSWORD(?) , ? , NOW() , NOW())";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1,insertId);
stmt.setString(2,insertPw);
stmt.setString(3,insertName);



System.out.println(stmt);	// 콘솔로 id pw 이름 값 확인

int row = stmt.executeUpdate();	//업데이트
if (row==1) {					//업데이트 확인
	System.out.println("입력성공");
}  else {
	System.out.println("입력실패");
}


response.sendRedirect(request.getContextPath()+"/loginForm.jsp"); // 로그인폼으로 이동

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