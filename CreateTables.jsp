<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Tables</title>
</head>
<body>
	<%= "Click \"Submit\" to create tables." %>
	<form action = "CreateTablesResult.jsp" method = "POST"> 
		<input type = "submit" value = "Submit" />
			<%
			String connectionURL = "jdbc:mysql://localhost/university";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "Sneakythechamp98");
			String[] statements = {
					"CREATE TABLE students\r\n" + 
					"	(snum INTEGER NOT NULL,\r\n" + 
					"	 ssn INTEGER NOT NULL,\r\n" + 
					"	 name VARCHAR(10),\r\n" + 
					"	 gender VARCHAR(1),\r\n" + 
					"	 dob DATETIME,\r\n" + 
					"	 c_addr VARCHAR(20),\r\n" + 
					"	 c_phone VARCHAR(10),\r\n" + 
					"	 p_addr VARCHAR(20),\r\n" + 
					"	 p_phone VARCHAR(10),\r\n" + 
					"	 PRIMARY KEY(ssn),\r\n" + 
					"     UNIQUE(snum));\r\n",
					
					"CREATE TABLE departments\r\n" + 
					"	(code INTEGER,\r\n" + 
					"	 name VARCHAR(50),\r\n" + 
					"	 phone VARCHAR(10),\r\n" + 
					"	 college VARCHAR(20),\r\n" + 
					"	 PRIMARY KEY (code),\r\n" + 
					"	 UNIQUE(name));\r\n",
					
					"CREATE TABLE degrees\r\n" + 
					"	(name VARCHAR(50),\r\n" + 
					"	 level VARCHAR(5),\r\n" + 
					"	 department_code INTEGER,\r\n" + 
					"	 PRIMARY KEY(name, level),\r\n" + 
					"	 FOREIGN KEY(department_code) REFERENCES departments(code)\r\n" + 
					"     ON DELETE CASCADE);\r\n",

					"CREATE TABLE courses\r\n" + 
					"	(number INTEGER NOT NULL,\r\n" + 
					"	 name VARCHAR(50),\r\n" + 
					"	 description VARCHAR(50),\r\n" + 
					"	 credithours INTEGER,\r\n" + 
					"	 level VARCHAR(20),\r\n" + 
					"	 department_code INTEGER,\r\n" + 
					"	 PRIMARY KEY(number),\r\n" + 
					"	 UNIQUE (name),\r\n" + 
					"	 FOREIGN KEY(department_code) REFERENCES departments(code)\r\n" + 
					"     ON DELETE CASCADE);\r\n",
					
					"CREATE TABLE register\r\n" + 
					"	(snum INTEGER,\r\n" + 
					"	 course_number INTEGER,\r\n" + 
					"	 regtime VARCHAR(20),\r\n" + 
					"	 grade INTEGER,\r\n" + 
					"	 PRIMARY KEY(snum, course_number),\r\n" + 
					"	 FOREIGN KEY(snum) REFERENCES students(snum),\r\n" + 
					"	 FOREIGN KEY(course_number) REFERENCES courses(number)\r\n" + 
					"     ON DELETE CASCADE);\r\n", 
	 
					"CREATE TABLE major\r\n" + 
					"	(snum INTEGER,\r\n" + 
					"	 name VARCHAR(50),\r\n" + 
					"	 level VARCHAR(5),\r\n" + 
					"	 PRIMARY KEY(snum, name, level),\r\n" + 
					"	 FOREIGN KEY(snum) REFERENCES students(snum),\r\n" + 
					"     FOREIGN KEY(name, level) REFERENCES degrees(name, level)\r\n" + 
					"     ON DELETE CASCADE);\r\n", 

					"CREATE TABLE minor\r\n" + 
					"	(snum INTEGER,\r\n" + 
					"	 name VARCHAR(50),\r\n" + 
					"	 level VARCHAR(5),\r\n" + 
					"     FOREIGN KEY(name) REFERENCES degrees(name),\r\n" + 
					"	 PRIMARY KEY(snum, name, level),\r\n" + 
					"	 FOREIGN KEY(snum) REFERENCES students(snum),\r\n" + 
					"     FOREIGN KEY(name, level) REFERENCES degrees(name, level)\r\n" + 
					"     ON DELETE CASCADE);"
			};
			Statement stmt = null;
			for(int i = 0; i < statements.length; i++) {
				stmt = connection.createStatement();
				String sql = statements[i];
				stmt.execute(sql);
			}
			
			
			
			%>
	</form>
</body>
</html>