<!-- updateMemberPwAction -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	if(session.getAttribute("loginId") == null) { // 본인 세션에 loginId를 만든적이 없다 -> 로그인 없다
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}
	
	String updatePw = request.getParameter("updatePw");			//form으로 받은 updatePw 값 가져오기 
	String loginId = (String)(session.getAttribute("loginId"));	//session에서 id 값 가져오기
	String pw = request.getParameter("pw");
	System.out.println(loginId+"<------ 비밀번호 변경중인 아이디");		// 콘솔로 id pw 체크
	System.out.println(pw+"<------ 원래 비밀번호");
	System.out.println(updatePw+"<------ 변경할 비밀번호");
	
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/test";
	String dbuser = "root";
	String dbpw = "1234";
	Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
	
	
	
	String sql = "UPDATE member SET member_pw = PASSWORD(?),updatedate = NOW() WHERE member_id =? AND member_pw = PASSWORD(?)"; // pw는 암호화로 UPDATE
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1,updatePw); 	// pw 변경
	
	stmt.setString(2,loginId);		// id 조건넣기
	stmt.setString(3,pw);			// 원래 pw 확인
	int rowsUpdated = stmt.executeUpdate();
	System.out.println(rowsUpdated+"<------ 업데이트 확인");
	if (rowsUpdated > 0) {
		// 업데이트가 성공한 경우
		response.sendRedirect(request.getContextPath() + "/logoutAction.jsp"); //로그아웃세션으로 보냄
	}else{	//실패시 오류메세지 출력
		%>
		<div>비밀번호 오류</div>
		<%
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