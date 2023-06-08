<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Gateway</title>
</head>
<body>
<jsp:useBean id="flightBean" class="com.simpli.FlightBean" scope="session"></jsp:useBean>

<sql:setDataSource
    var="dataSource"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/flyaway"
    user="root"
    password="Simplilearn"
/>
<% String id = request.getParameter("id"); 
String passengers = request.getParameter("passengers");
String ticket_price = request.getParameter("ticket_price");
ticket_price = ticket_price.replace(".00", "");
int passengers_num = Integer.parseInt(passengers);
int ticket_price_num = Integer.parseInt(ticket_price);
int finalNumber = passengers_num * ticket_price_num;
%>

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM flights where ID = <%= id %>
</sql:query>

         

        
<h1><center>Make Payment<center></h1>
<form action="payment-update.jsp" method="post">
Card Number: <input type="text" name="cardNumber" id="cardNumber" maxlength="16" required><br><br>
Card HolderName: <input type="text" name="cardName" id="cardName" required><br><br>
Expiry Date: <input type="month" name="cardExpDate" id="cardExpDate" required><br><br>
CVV: <input type="password" name="cardCvv" id="cardCvv" maxlength="3" required><br><br>
Amount Per Person: <input type="text" name="amountperhead" id="amountperhead" disabled="disabled" value=<c:forEach var="row" items="${result.rows}">
            ${row.price}
        </c:forEach>><br><br>
Number of Passengers: <input type="text" name="numpassengers" id="numpassengers" disabled="disabled" value=<jsp:getProperty property="passengers" name="flightBean"/>><br><br>
Total Amount: <input type="text" name="totalamount" id="totalamount" disabled="disabled" value=<%=finalNumber %>><br><br>
<input type="hidden" name="passengers" id="passengers" value=<%=passengers%>>
<input type="hidden" name="ticket_price" id="ticket_price" value=<c:forEach var="row" items="${result.rows}">
            ${row.price}
        </c:forEach>>
        <input type="hidden" name="source" id="source" value=<c:forEach var="row" items="${result.rows}">
            ${row.source}
        </c:forEach>>
        <input type="hidden" name="destination" id="destination" value=<c:forEach var="row" items="${result.rows}">
            ${row.destination}
        </c:forEach>>
        <input type="hidden" name="airline" id="airline" value=<c:forEach var="row" items="${result.rows}">
            ${row.airline}
        </c:forEach>>
        <input type="hidden" name="price" id="price" value=<c:forEach var="row" items="${result.rows}">
            ${row.price}
        </c:forEach>>
        <input type="hidden" name="dateOfTravel" id="dateOfTravel" value=<c:forEach var="row" items="${result.rows}">
            ${row.date_of_travel}
        </c:forEach>>
<input type="submit" value="Make Payment">
</form>

</body>
</html>