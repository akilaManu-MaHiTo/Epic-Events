<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.database.ServiceData" %>
<%@ page import="com.model.services.Services" %>
<%@ page import="com.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Madimi+One&display=swap" rel="stylesheet">

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles/payment.css">
    <meta charset="ISO-8859-1">
    <title>epic Event home</title>
</head>
<body>
    <img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    
    <div class="sign">
        Sign Up
    </div>
    
    <div class="log">
        Log In
    </div>
	
	<div class="left-devider">
		<div id="services" class="services-container">
		    <%
		        ServiceData serviceData = new ServiceData();
		        List<Services> servicesList = serviceData.getServices();
		        for (Services service : servicesList) {
		    %>
		    <div class="service-item">
		        <div class="service-price">Price: <%= service.getPrice() %></div>
		        <div class="service-description">Description: <%= service.getDescription() %></div>
		        <form class="save-service-form" action="SaveServiceServlet" method="post">
		            <input type="hidden" name="serviceId" value="<%= service.getServiceId() %>">
		            <input type="submit" class="save-button" value="+">
		        </form>
		    </div>
		    <% } %>
		</div>

		</div>
	

	
	<div class="right-devider">	
	
		<div class="verticle">
		</div>
	
		<div>
		    <button class="pay-method" type="button" onclick="window.location.href='visa.jsp'">
		        <img alt="" src="img/visa.png">
		        <div class="pay-pos1">Visa</div>
		    </button>
		</div>
		"F:/PaymentForm/paymentForm.jsp"
		<div>
		    <button class="pay-method" type="button" onclick="window.location.href='master.jsp'">
		        <img alt="" src="img/master.png">
		        <div class="pay-pos2">Master</div>
		    </button>
		</div>
		
		<div>
		    <button class="pay-method" type="button" onclick="window.location.href='paypal.jsp'">
		        <img alt="" src="img/paypal.png">
		        <div class="pay-pos3">PayPal</div>
		    </button>
		</div>
		
		<div>
		    <button class="pay-method" type="button" onclick="window.location.href='gplay.jsp'">
		        <img alt="" src="img/Gplay.png">
		        <div class="pay-pos4">Google Pay</div>
		    </button>
		</div>

		
	</div>
	


    <script src="JS/home.js"></script>
</body>
</html>
