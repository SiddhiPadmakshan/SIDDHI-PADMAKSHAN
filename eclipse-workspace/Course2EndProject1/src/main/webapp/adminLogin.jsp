<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin login Page</title>
</head>
<body>
<center><h1>Admin Login Page</h1></center>
<%
if(request.getParameter("error") != null){
	out.println("<p style='color:red;''><b>Incorrect Admin Login Attempt.<b></p>");
}
%>
<%
if(request.getParameter("update") != null){
	out.println("<p style='color:green;''><b>Password Updated.<b></p>");
}
%>

<form action="adminLoginVerification.jsp" method="post">
Username: <input type="text" name="adminName" id="adminName" value="admin@admin"><br><br>
Password: <input type="password" name="adminPass" id="adminPass"><br><br>
<input type="submit" value="Login">
</form>
</body>
</html>