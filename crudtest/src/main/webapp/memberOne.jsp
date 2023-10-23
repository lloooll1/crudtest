<!-- memberOne -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%
	if(session.getAttribute("loginId") == null) { // 본인 세션에 loginId를 만든적이 없다 -> 로그인 없다
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}
	String loginId = (String)(session.getAttribute("loginId"));	//id는 세션에서 가져옴
	
	
	
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/test";
	String dbuser = "root";
	String dbpw = "1234";
	Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
	
	// 각종 값 sql로 받아오기
	String sql = "SELECT member_id memberId, member_pw memberPw, member_name memberName,createdate createDate, updatedate updateDate FROM member WHERE member_id = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	System.out.println(loginId+ " <----------- 로그인아이디 출력확인 ");
	stmt.setString(1, loginId); // DB에서 id랑 매치되는 값 출력받기
	
	ResultSet rs = stmt.executeQuery();
	if (rs.next()) {
	    String memberName = rs.getString("memberName");			
	    System.out.println(memberName + " <----------- 이름값 출력확인 ");
	    String updateDate = rs.getString("updateDate");
	    String createDate = rs.getString("createDate");
	}
	
	String memberName = rs.getString("memberName");				//sql에서 이름값 가져오기
	String updateDate = rs.getString("updateDate");				//sql에서 업데이트날짜 가져오기
	String createDate = rs.getString("createDate");				//sql에서 회원가입날짜 가져오기
	
	String memberId = (String)(session.getAttribute("loginId"));
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table table-bordered table-hover">
		<tr>
			<td>아이디</td>
			<td><%=memberId%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=memberName%></td>
		</tr>
		<tr>
			<td>업데이트</td>
			<td><%=updateDate%></td>
		</tr>
		<tr>
			<td>계정생성일</td>
			<td><%=createDate%></td>
		</tr>
		
		</table>
		<!-- 변경전 / 변경후 비밀번호 입력 -->
		<a href="<%=request.getContextPath()%>/updateMemberPwForm.jsp" 
		class="btn btn-success">비밀번호수정</a>
		<br>
		<!-- 비밀번호 입력 -->
		<a href="<%=request.getContextPath()%>/deleteMemberForm.jsp"
		class="btn btn-danger">회원탈퇴</a>
		<br><br>
		<a href="<%=request.getContextPath()%>/loginForm.jsp"
		class="btn btn-primary">HOME</a>
		
		
	</div>
</body>
</html>