<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="styles/birthday.css">
<link rel="stylesheet" type="text/css" href="styles/planform.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
    
    <form action="AddEventDetailServlet" method="post">
   <div class="p">
   		<h1>Custom plan-Birthday</h1>
   		<h2>Tell us more about your event...</h2>
   		<br><br>
   		<div class="x">
   		First Name<br>
   		<input type="text" name="firstName"><br/><br/>
   		Last Name<br>
   		<input type="text" name="lastName"><br/><br/>
   		Age<br>
   		<input type="number" name="age"><br/><br/>
		<br/><br/>
   		</div>
   		
   		<div class="y">
   			Event date<br/>
   			<input type="date" name="date"><br/><br/>		
   		</div>
   		<input type="submit"><br/><br/>
   		
   		
   		</div>
   		</form>

</body>
</html>