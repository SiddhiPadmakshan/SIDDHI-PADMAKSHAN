<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Details</title>
</head>
<body>


<sql:setDataSource
    var="dataSource"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/flyaway"
    user="root"
    password="Simplilearn"
/>
<% String id = request.getParameter("id");
	String passengers = request.getParameter("passengers");
	 String email = request.getParameter("userEmail");
	String userPass = request.getParameter("userPass");
%>

<sql:query dataSource="${dataSource}" var="result2">
    SELECT email FROM users where email='<%=email%>';  
</sql:query>

<sql:query dataSource="${dataSource}" var="result1">
    SELECT * FROM users where email='<%=email%>';
</sql:query>

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM flights where ID=<%=id%>;
</sql:query>

<c:forEach var="row1" items="${result1.rows}">  
<c:set var="pass" scope="session" value="${row1.userpassword}"></c:set>
<c:set var="email" scope="session" value="${row1.email}"></c:set>
<c:set var="passCheck" scope="session" value='<%=userPass%>'></c:set>
<c:set var="emailCheck" scope="session" value='<%=email%>'></c:set>
<c:choose>
  <c:when test="${email == emailCheck && pass == passCheck}">
  <center><h3>Book The Selected Flight<h3></center>
<h4>Flight details:</h4>
	<table border="1">
    <thead>
        <tr>
            <th>Source</th>
            <th>Destination</th>
            <th>Airline</th>
            <th>Price</th>
            <th>Seats Available</th>
            <th>Departure</th>
           
        </tr>
    </thead>
    <tbody>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td>${row.source}</td>
                <td>${row.destination}</td>
                <td>${row.airline}</td>
                <td>${row.price}</td>
                <td>${row.passenger}</td>
                <td>${row.date_of_travel}</td>
                
            </tr>
        </c:forEach>
    </tbody>
</table>
<br><br>


<form action="payment-gateway.jsp?id=<%= id %>" method="post">
<input type="hidden" name="passengers" id="passengers" value=<%=passengers%>>
<input type="hidden" name="ticket_price" id="ticket_price" value=<c:forEach var="row" items="${result.rows}">
            ${row.price}
        </c:forEach>>
<input type="hidden" name="id" id="id" value=<%=id%>>
<input type="submit" value="Make Payment">
</form>
</c:when>
<c:otherwise>
<%
RequestDispatcher rd = request.getRequestDispatcher("register.jsp?error=1");
rd.forward(request, response); 
%>  
</c:otherwise>
</c:choose>
</c:forEach>


<c:if test="${result2.rowCount == 0}">
<%
RequestDispatcher rd = request.getRequestDispatcher("register.jsp?error1=1");
rd.forward(request, response); 
%> 
</c:if>


</body>
</html>