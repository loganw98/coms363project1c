<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Records</title>
</head>
<body>
	<%= "Click \"Submit\" to create tables." %>
	<form action = "InsertRecordsResult.jsp" method = "POST"> 
		<input type = "submit" value = "Submit" />
			<%
			String connectionURL = "jdbc:mysql://localhost/university";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "Sneakythechamp98");
			String[] statements = {
				"INSERT INTO students(snum, ssn, name, gender, dob, c_addr, c_phone, p_addr, p_phone)\r\n" + 
				"VALUES \r\n" + 
				"	(1001,654651234,'Randy','M','2000/12/01','301 E Hall',5152700988,'121 Main',7083066321),\r\n" + 
				"	(1002,123097834,'Victor','M','2000/05/06','270 W Hall',5151234578,'702 Walnut',7080366333),\r\n" + 
				"	(1003,978012431,'John','M','1999/07/08','201 W Hall',5154132805,'888 University',5152012011),\r\n" + 
				"	(1004,746897816,'Seth','M','1998/12/30','199 N Hall',5158891504,'21 Green',5154132907),\r\n" + 
				"	(1005,186032894,'Nicole','F','2001/04/01','178 S Hall',5158891155,'13 Gray',5157162071),\r\n" + 
				"	(1006,534218752,'Becky','F','2001/05/16','12 N Hall',5157083698,'189 Clark',2034367632),\r\n" + 
				"	(1007,432609519,'Kevin','M','2000/08/12','75 E Hall',5157082497,'89 National',7182340772);\r\n",
				
				"INSERT INTO departments(code,name,phone,college)\r\n" + 
				"VALUES\r\n" + 
				"	(401,'Computer Science',5152982801,'LAS'),\r\n" + 
				"	(402,'Mathematics',5152982802,'LAS'),\r\n" + 
				"	(403,'Chemical Engineering',5152982803,'Engineering'),\r\n" + 
				"	(404,'Landscape Architect',5152982804,'Design');\r\n",
				
				"INSERT INTO degrees(name,level,department_code)\r\n" + 
				"VALUES\r\n" + 
				"	('Computer Science','BS',401),\r\n" + 
				"	('Software Engineering','BS',401),\r\n" + 
				"	('Computer Science','MS',401),\r\n" + 
				"	('Computer Science','PhD',401),\r\n" + 
				"	('Applied Mathematics','MS',402),\r\n" + 
				"	('Chemical Engineering','BS',403),\r\n" + 
				"	('Landscape Architect','BS',404);\r\n",
				
				"INSERT INTO major(snum,name,level)\r\n" + 
				"VALUES\r\n" + 
				"	(1001,'Computer Science','BS'),\r\n" + 
				"	(1002,'Software Engineering','BS'),\r\n" + 
				"	(1003,'Chemical Engineering','BS'),\r\n" + 
				"	(1004,'Landscape Architect','BS'),\r\n" + 
				"	(1005,'Computer Science','MS'),\r\n" + 
				"	(1006,'Applied Mathematics','MS'),\r\n" + 
				"	(1007,'Computer Science','PhD');\r\n",
				
				"INSERT INTO minor(snum,name,level)\r\n" + 
				"VALUES\r\n" + 
				"	(1007,'Applied Mathematics','MS'),\r\n" + 
				"	(1005,'Applied Mathematics','MS'),\r\n" + 
				"	(1001,'Software Engineering','BS');\r\n",
				
				"INSERT INTO courses(number,name,description,credithours,level,department_code)\r\n" + 
				"VALUES\r\n" + 
				"	(113,'Spreadsheet','Microsoft Excel and Access',3,'Undergraduate',401),\r\n" + 
				"	(311,'Algorithm','Design and Analysis',3,'Undergraduate',401),\r\n" + 
				"	(531,'Theory of Computation','Theorem and Probability',3,'Graduate',401),\r\n" + 
				"	(363,'Database','Design Principle',3,'Undergraduate',401),\r\n" + 
				"	(412,'Water Management','Water Management',3,'Undergraduate',404),\r\n" + 
				"	(228,'Special Topics','Interesting Topics about CE',3,'Undergraduate',403),\r\n" + 
				"	(101,'Calculus','Limit and Derivate',4,'Undergraduate',402);\r\n",
				
				"INSERT INTO register(snum,course_number,regtime,grade)\r\n" + 
				"VALUES\r\n" + 
				"	(1001,363,'Fall2015',3),\r\n" + 
				"	(1002,311,'Fall2015',4),\r\n" + 
				"	(1003,228,'Fall2015',4),\r\n" + 
				"	(1004,363,'Spring2015',3),\r\n" + 
				"	(1005,531,'Spring2015',4),\r\n" + 
				"	(1006,363,'Fall2015',3),\r\n" + 
				"	(1007,531,'Spring2015',4);\r\n"
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
