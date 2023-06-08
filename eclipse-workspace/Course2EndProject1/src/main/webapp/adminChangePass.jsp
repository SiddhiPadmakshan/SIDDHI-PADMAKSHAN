<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Admin Password</title>
</head>
<body>
<%
String newPassword = request.getParameter("adminpassUpdate");

%>
<sql:setDataSource
    var="dataSource"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/flyaway"
    user="root"
    password="Simplilearn"
/>

<sql:update dataSource="${dataSource}" var="count">
    UPDATE users SET userpassword = '<%=newPassword%>' WHERE email = 'admin@admin'; 
</sql:update>
<%
RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp?update=1");
rd.forward(request, response); 
%> 
</body>
</html>