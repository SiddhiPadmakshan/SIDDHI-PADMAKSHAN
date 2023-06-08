<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank you! Payment Successful</title>
</head>
<body>
<jsp:useBean id="flightBean" class="com.simpli.FlightBean" scope="session"></jsp:useBean>
<%
String cardholder = request.getParameter("cardName");
String id = request.getParameter("id"); 
String passengers = request.getParameter("passengers");
String ticket_price = request.getParameter("ticket_price");
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String airline = request.getParameter("airline");
String price = request.getParameter("price");
String dateOfTravel = request.getParameter("dateOfTravel");
ticket_price = ticket_price.replace(".00", "");
int passengers_num = Integer.parseInt(passengers);
int ticket_price_num = Integer.parseInt(ticket_price);
int finalNumber = passengers_num * ticket_price_num;
%>
<center><h1 style="color:green;">Booking done successfully for <%=cardholder%>!!</h1></center><br>
<h2>Booking Details:</h2>
<ul>
<li><h3 style="color:grey;">Total Seats Booked: <jsp:getProperty property="passengers" name="flightBean"/></h3></li>
<li><h3 style="color:grey;">Price of Ticket: <%=price%></h3></li>
<li><h3 style="color:grey;">Total Amount Paid: <%=finalNumber%></h3></li>
<li><h3 style="color:grey;">Source: <%=source%></h3></li>
<li><h3 style="color:grey;">Destination: <%=destination%></h3></li>
<li><h3 style="color:grey;">Airline: <%=airline%></h3></li>
<li><h3 style="color:grey;">Date of Travel: <%=dateOfTravel%></h3></li>
</ul>
<br><br>
<span style="position:absolute; bottom:5%; left:40%"><h2>Thank you for choosing <b style="color:blue;">FlyAway</b></h2></span>

<a href="index.jsp" style="position:absolute; bottom:3%; left:47%">Return to home page</a>
</body>
</html>