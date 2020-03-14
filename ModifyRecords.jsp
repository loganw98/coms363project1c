<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Records</title>
</head>
<body>
    <%
			String connectionURL = "jdbc:mysql://localhost/university";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "Sneakythechamp98");
			
			String[] statements = {"UPDATE students\r\n" + 
				"SET\r\n" + 
				"	name = 'Scott'\r\n" + 
				"WHERE\r\n" + 
				"	ssn = 746897816;\r\n"
		};
		Statement stmt = null;
		for(int i = 0; i < statements.length; i++) {
			stmt = connect.createStatement();
			String sql = statements[i];
			stmt.execute(sql);
		}
			
	%>
</body>
</html>
