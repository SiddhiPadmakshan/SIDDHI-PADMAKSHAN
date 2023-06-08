<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
<sql:setDataSource
    var="dataSource"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/flyaway"
    user="root"
    password="Simplilearn"
/>

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM users WHERE email = 'admin@admin'
</sql:query>

<%
String adminName = request.getParameter("adminName");
String adminPass = request.getParameter("adminPass");
%>

<c:forEach var="row" items="${result.rows}">  
<c:set var="pass" scope="session" value="${row.userpassword}"></c:set>
<c:set var="name" scope="session" value="admin@admin"></c:set>
<c:set var="passCheck" scope="session" value='<%=adminPass%>'></c:set>
<c:set var="nameCheck" scope="session" value='<%=adminName%>'></c:set>
<c:choose>
  <c:when test="${name == nameCheck && pass == passCheck}">
	<center><h2>Admin Page Options</h2></center>
		<hr>
		<b><p>Update Admin Password</p></b>
		<form action="adminChangePass.jsp" method="post">
		New Password: <input type="password" name="adminpassUpdate" id="adminpassUpdate"><br><br>
		<input type="submit" value="Update Password">
		</form><br><br><hr>
		<b><p>View list of Destination and Sources</p></b>
		<a href="adminMasterListSources.jsp">MasterList of sources and Destination</a><br><br><hr>
		<b><p>View list of Airlines</p></b>
		<a href="adminMasterListAirlines.jsp">MasterList of Airlines</a><br><br><hr>
		<b><p>View list of Flights</p></b>
		<a href="adminflightList.jsp">List of flights</a><br><br><hr>
	



</c:when>
<c:otherwise>
<%
RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp?error=1");
rd.forward(request, response); 
%>  
</c:otherwise>
</c:choose>
</c:forEach>



              
</body>
</html>