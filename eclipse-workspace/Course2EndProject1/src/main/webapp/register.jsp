<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
<center>
<h1>FlyAway</h1>
<h2>The best way to book a flight</h2></center>
<%
if(request.getParameter("error") != null){
	out.println("<p style='color:red;''> Password for this User Email is incorrect.<p>");
}
%>
<%
if(request.getParameter("error1") != null){
	out.println("<p style='color:red;''> User Email not found.<br>Try registering if you do not have an account.<p>");
}
%>
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


<h3>Register to book the flight</h3>
<form action="login.jsp" method="post">
Full Name:<input type="text" name="userName" id="userName" required><br><br>
Email:<input type="email" name="userEmail" id="userEmail" required ><br><br>
Age:<input type="number" name="userAge" id="userAge" required><br><br>
Gender:<input type="radio" id="male" name="userGender" value="Male" required>
  <label for="male">Male</label>
<input type="radio" id="female" name="userGender" value="Female" required>
  <label for="female">Female</label><br><br>
Password:<input type="password" name="userPass" id="userPass" placeholder="Minimum 6 Characters" required minlength="6"><br><br>
<input type="hidden" name="passengers" id="passengers" value=<%=passengers%>> 
<input type="hidden" name="id" id="id" value=<%=id%>> 
<input type="submit" value="Register">
</form><br>
Already on Flyaway?  <form action="login.jsp?id=<%=id%>" method="post">
<input type="hidden" name="passengers" id="passengers" value=<%=passengers%>>            
<input type="submit" value="Login" style="border:0; background:white; cursor:pointer; color:blue; text-decoration:underline; position: relative; left: 140px; top: -19.5px;">
</form> <br><br>
</body>
</html>
