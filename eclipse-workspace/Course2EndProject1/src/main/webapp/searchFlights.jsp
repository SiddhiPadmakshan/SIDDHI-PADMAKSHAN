
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Flights</title>
</head>
<body>
<jsp:useBean id="flightBean" class="com.simpli.FlightBean" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="flightBean"/>

<% String source = request.getParameter("source");
	String destination = request.getParameter("destination");
	String date = request.getParameter("startDate"); 
	LocalDate date1 = LocalDate.parse(date); 
	String passengers = request.getParameter("passengers"); 
	int passengersNum = Integer.parseInt(passengers);
	if(source.equals(destination) || date1.isBefore(java.time.LocalDate.now()) || passengersNum < 1){
	response.sendRedirect("index.jsp?error=1");
	}
	
%>

<sql:setDataSource
    var="dataSource"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/flyaway"
    user="root"
    password="Simplilearn"
/>

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM flights where source = '<jsp:getProperty property="source" name="flightBean"/>' and 
    destination = '<jsp:getProperty property="destination" name="flightBean"/>' and 
    date_of_travel >= '<jsp:getProperty property="startDate" name="flightBean"/>' and
    passenger >= '<jsp:getProperty property="passengers" name="flightBean"/>'
</sql:query>
<center>
<h1>FlyAway</h1>
<h2>The best way to book a flight</h2></center>
<h3>List of Available Flights for <%=passengers%> on <%=date%> from <%=source%> to <%=destination%></h3>
<table border="1">
    <thead>
        <tr>
            <th>Airline</th>
            <th>Price</th>
            <th>Seats Available</th>
            <th>Book now!</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td>${row.airline}</td>
                <td>${row.price}</td>
                <td>${row.passenger}</td>
                <td>
                    <form action="register.jsp?id=${row.id}" method="post">
<input type="hidden" name="passengers" id="passengers" value=<%=passengers%>>            
<input type="submit" value="Book this flight" style="border:0; background:white; cursor:pointer; color:blue; text-decoration:underline;">
</form> 
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>