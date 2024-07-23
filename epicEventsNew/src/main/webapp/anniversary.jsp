<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Madimi+One&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
    <link rel="stylesheet" type="text/css" href="styles/anniversary.css">
    <meta charset="ISO-8859-1">
    <title>Birthday</title>
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
   		
   	<div class="E-plan">
		<div class="cat-plan1">
			<div class="W-plan">
	   			SILVER PLAN
	   		</div>
	   		
	   		<div class="dep-plan">
	   			This plan is designed for small-scale 
	   			events and basic event planning needs.	  	
	   		</div>
	   		
	   		<div class="list-plan">
	   			<div class="list-space"><i class="fa fa-circle"></i> Venue selection assistance</div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i> Basic decoration options</div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i> Coordination with essential vendors</div> 
	   			(catering, entertainment)<br>	   			
	   		</div>
	   		
	   		<div class="price-plan">
	   			Rs. 50,000+ 
	   		</div>
	   		
			    <button class="pur-plan" type="button" onclick="window.location.href='payment.jsp'">
			        Purchase Now
			    </button>
			

		</div>		
				<div class="cat-plan2">
			<div class="W-plan">
	   			GOLD PLAN
	   		</div>
	   		
	   		<div class="dep-plan">
	   			The Gold plan offers a more comprehensive package for 
	   			mid-sized events and more elaborate arrangements.	  	
	   		</div>
	   		
	   		<div class="list-plan2">
	   			<div class="list-space2"><i class="fa fa-circle"></i> Advanced venue selection with customization options</div><br>
	   			<div class="list-space2"><i class="fa fa-circle"></i> Themed decorations</div><br>
	   			<div class="list-space2"><i class="fa fa-circle"></i>Coordination of additional services (photography, transportation, accommodations)</div> 
	   			(catering, entertainment)<br>	   			
	   		</div>
	   		
	   		<div class="price-plan2">
	   			Rs. 90,000+ 
	   		</div>
	   		
			    <button class="pur-plan" type="button" onclick="window.location.href='payment.jsp'">
			        Purchase Now
			    </button>
			

		</div>
		
				<div class="cat-plan3">
			<div class="W-plan">
	   			CUSTOM PLAN
	   		</div>
	   		
	   		<div class="dep-plan">
	   			The Custom plan is tailored to meet specific requirements and cater to 
	   			large-scale events with complex needs.
	   		</div>
	   		
	   		<div class="list-plan">
	   			<div class="list-space"><i class="fa fa-circle"></i> Personalized consultation</div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i> Custom themes and decorations</div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i> Extensive vendor management</div> 
	   			(catering, entertainment)<br>	   			
	   		</div>
	   		
	   		<div class="price-plan3">
	   			 
	   		</div>
	   		
			    <button class="pur-plan" type="button" onclick="window.location.href='payment.jsp'">
			        Purchase Now
			    </button>
			

		</div>
		
	</div>
	
</body>
</html>
