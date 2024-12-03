<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
<%
	Connection conn = null;
	try {
		String url = "jdbc:mysql://localhost:3306/JSPBookDB";
		String user = "root";
		String pass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		out.println("데이터베이스 연결이 성공했습니다!");
	} catch (SQLException e) {
		out.println("데이터베이스 연결이 실패했습니다~ ㅠㅠ");
		out.println("SQLException: " + e.getMessage());
	} finally {
		if (conn != null)
			conn.close();
	}
%>
</body>
</html>