<!-- delete_process.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL: Delete</title>
</head>
<body>
<%@include file="connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try {
		String sql = "SELECT id, passwd FROM Member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			String rId = rs.getString("id");
			String rPw = rs.getString("passwd");
			
			if (id.equals(rId) && pw.equals(rPw)) {
				sql = "DELETE Member WHERE id=? AND passwd=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.executeUpdate();
				out.println("Member 테이블을 삭제했습니다.");
			} else {
				out.println("일치하는 비밀번호가 아닙니다!");
			}
		} else {
			out.println("Member 테이블에 일치하는 아이디가 없습니다.");
		}
		
	} catch (SQLException e) {
		out.println("Member 테이블에서 id 찾을 수 없었습니다~ ㅠㅠ");
		out.println("SQLException: " + e.getMessage());
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
</body>
</html>