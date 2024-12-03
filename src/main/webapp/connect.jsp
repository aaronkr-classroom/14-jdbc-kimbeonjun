<!-- connect.jsp -->
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/JSPBookDB";
	String user = "root";
	String pass = "1234";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pass);
%>