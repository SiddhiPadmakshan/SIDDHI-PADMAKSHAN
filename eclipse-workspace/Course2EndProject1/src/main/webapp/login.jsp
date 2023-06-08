<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>

<%String id = request.getParameter("id"); 
String passengers = request.getParameter("passengers");
%>

<sql:setDataSource
    var="dataSource"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/flyaway"
    user="root"
    password="Simplilearn"
/>

<%
String userMail = request.getParameter("userEmail");
String userPass = request.getParameter("userPass");
String statement = "";

if(!(userMail == null || userPass== null)){
	
	statement = "INSERT INTO users(email,userpassword) values('"+userMail+"','"+userPass+"');";
}else{
	
	statement = "INSERT INTO users(email,userpassword) values('Dummy','Dummy');";
}
%>

<sql:update dataSource="${dataSource}" var="count">
    <%=statement%>
</sql:update>
<sql:update dataSource="${dataSource}" var="count">
    DELETE FROM users WHERE email = 'Dummy';
</sql:update>

<center>
<h1>FlyAway</h1>
<h2>The best way to book a flight</h2></center>
<h3>Login to book the flight</h3>
<form action="bookflight.jsp" method="post">
Email: <input type="email" name="userEmail" id="userEmail" required placeholder="email*"><br><br>
Password: <input type="password" name="userPass" id="userPass" placeholder="password*" required minlength="6"><br><br>
<input type="hidden" name="passengers" id="passengers" value=<%=passengers%>> 
<input type="hidden" name="id" id="id" value=<%=id%>>
<input type="submit" value="Login">
</form>
</body>
</html>