<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MasterList of Airlines</title>
</head>
<body>
<center><h1>MasterList of Airlines</h1></center>
<sql:setDataSource
    var="dataSource"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/flyaway"
    user="root"
    password="Simplilearn"
/>

<sql:query dataSource="${dataSource}" var="result">
    SELECT distinct airline FROM flights;
</sql:query>
<center>
<table border="1">
    <thead>
        <tr>
            <th>Airline</th>
        </tr>
    </thead>
    <tbody>
<c:forEach var="row" items="${result.rows}">

            <tr>
                <td>${row.airline}</td>        
            </tr>
        </c:forEach>
        </tbody>
        </table>
        </center>
</body>
</html>