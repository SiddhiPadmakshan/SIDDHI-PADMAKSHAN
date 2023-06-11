<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
     


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search for Flights</title>
</head>
<body>
<center><h3>FlyAway the best way to book a flight<h3></center>
<center><h4>Enter the details for the flight you want to book.<h4></center>
<%
if(request.getParameter("error") != null){
	out.println("<p style='color:red;''><b>Note: <br>Source and the Destination cannot be the same.<br>" +
	"Date can not be from before the current date.<br> Number of passengers cannot be less than 1.<b></p>");
}
%>


<right><form action="adminLogin.jsp" method="post" style="position:absolute; top:10px; right:20px;">
<input type="submit" value="Admin Login">
</form></right>
				
				
<form action="searchFlights.jsp" method="post">
Date:<input type="date" name="startDate" id="startDate" required><br><br>

<label for="source">Source (Traveling From):</label>
<select name="source" id="source" required>
  <option value="Mumbai">Mumbai</option>
  <option value="Delhi">Delhi</option>
  <option value="Bangalore">Bangalore</option>
  <option value="Trivandrum">Trivandrum</option>
  <option value="Toronto">Toronto</option>
<option value="California">California</option>
<option value="Dubai">Dubai</option>
<option value="Texas">Texas</option>
</select>
<br><br>

<label for="destination">Destination (Traveling To):</label>
<select name="destination" id="destination" required>
<option value="Toronto">Toronto</option>
<option value="California">California</option>
<option value="Dubai">Dubai</option>
<option value="Texas">Texas</option>
 <option value="Mumbai">Mumbai</option>
  <option value="Delhi">Delhi</option>
  <option value="Bangalore">Bangalore</option>
  <option value="Trivandrum">Trivandrum</option>
</select>
<br><br>

Number of Passengers :<input type="number" name="passengers" id="passengers" required><br><br>
<input type="submit" value="Search">

</form>
</body>
</html>

