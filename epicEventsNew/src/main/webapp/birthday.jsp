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
	<!-- body fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles/birthday.css">
    
    <!-- Navi fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Satisfy&family=Square+Peg&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">
    
    <meta charset="ISO-8859-1">
    <title>Birthday</title>
</head>
<body>

	<!-- Loader -->
	<div id="preloader">
  	<div id="loader"></div>
	</div>
<!-- Loader -->

    <img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul>
            <li><a href="User_home.jsp">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
   		
   	<div class="E-plan">
		<div class="cat-plan1">
			<div class="W-plan">
	   			<span>SILVER PLAN</span>
	   		</div>
	   		
	   		<div class="dep-plan">
	   			<span>This plan is designed for small-scale 
	   			events and basic event planning needs.</span>	  	
	   		</div>
	   		
	   		<div class="list-plan">
	   			<div class="list-space"><i class="fa fa-circle"></i><span> Venue selection assistance </span></div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i><span> Basic decoration options </span></div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i><span> Coordination with essential vendors</span></div> 
	   			<span>(catering, entertainment)</span><br>	   			
	   		</div>
	   		
	   		<div class="price-plan">
	   			<span>Rs. 50,000+</span> 
	   		</div>
	   		
			    <button class="pur-plan btn1" type="button" onclick="window.location.href='loader.jsp'">
			        
			    </button>
			

		</div>		
				<div class="cat-plan2">
			<div class="W-plan">
	   			<span>GOLD PLAN</span>
	   		</div>
	   		
	   		<div class="dep-plan">
	   			<span>The Gold plan offers a more comprehensive package for 
	   			mid-sized events and more elaborate arrangements.</span>	  	
	   		</div>
	   		
	   		<div class="list-plan2">
	   			<div class="list-space2"><i class="fa fa-circle"></i><span> Advanced venue selection with customization options</span></div><br>
	   			<div class="list-space2"><i class="fa fa-circle"></i><span> Themed decorations </span></div><br>
	   			<div class="list-space2"><i class="fa fa-circle"></i><span> Coordination of additional services (photography, transportation, accommodations) </span></div> 
	   			<span>(catering, entertainment)</span><br>	   			
	   		</div>
	   		
	   		<div class="price-plan2">
	   			<span>Rs. 90,000+ </span>
	   		</div>
	   		
			    <button class="pur-plan btn2" type="button" onclick="window.location.href='loader.jsp'">
			      
			    </button>
			

		</div>
		
				<div class="cat-plan3">
			<div class="W-plan">
	   			<span>CUSTOM PLAN</span>
	   		</div>
	   		
	   		<div class="dep-plan">
	   			<span>The Custom plan is tailored to meet specific requirements and cater to 
	   			large-scale events with complex needs.</span>
	   		</div>
	   		
	   		<div class="list-plan">
	   			<div class="list-space"><i class="fa fa-circle"></i><span> Personalized consultation </span></div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i><span> Custom themes and decorations </span></div><br>
	   			<div class="list-space"><i class="fa fa-circle"></i><span> Extensive vendor management </span></div> 
	   			<span>(catering, entertainment)</span><br>	   			
	   		</div>
	   		
	   		<div class="price-plan3">
	   			 
	   		</div>
	   		
			    <button class="pur-plan btn3" type="button" onclick="window.location.href='planform1.jsp'">
			       
			    </button>
			

		</div>
		
	</div>
	
	<footer class="footer">
        <div class="footer__addr">
          <img src="img/epicEventslogo.png" class="logo">
              
          <h3 class="con">Contact Us</h3>
            <div class="icons">
                
                <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-square"></i></a>
                <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram" aria-hidden="true"></i></a>
                <a href="https://www.whatsapp.com" target="_blank"><i class="fab fa-whatsapp" aria-hidden="true"></i></a>

            </div>
                
            <a class="footer__btn" href="mailto:example@gmail.com">Email Us</a>
        </div>
        
        <ul class="footer__nav">
          <li class="nav__item">
            <h2 class="nav__title">Media</h2>
      
            <ul class="nav__ul">
              <li>
                <a href="#">Online</a>
              </li>
      
              <li>
                <a href="#">Print</a>
              </li>
                  
              <li>
                <a href="#">Alternative Ads</a>
              </li>
            </ul>
          </li>
          
          <li class="nav__item nav__item--extra">
            <h2 class="nav__title">Our Partners</h2>

            
            <ul class="nav__ul nav__ul--extra">
              <li>
                <a href="#">Shangri-La</a>
              </li>
              
              <li>
                <a href="#">events.lk</a>
              </li>
              
              <li>
                <a href="#">prime events</a>
              </li>
              
              <li>
                <a href="#">YourEvent</a>
              </li>
              
              <li>
                <a href="#">eventLanka</a>
              </li>
              
              <li>
                <a href="#">Plan.lk</a>
              </li>
            </ul>

            <!-- <h4 class="quote">Let's Make Magic</h4> -->

          </li>
          
          <li class="nav__item">
            <h2 class="nav__title">Legal</h2>
            
            <ul class="nav__ul">
              <li>
                <a href="#">Privacy Policy</a>
              </li>
              
              <li>
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </li>
        </ul>
        
        <div class="legal">
          <p class="rights">&copy; 2023 epicEvents. All rights reserved.</p>
          
          <div class="legal__links">
            <span class="epic">epicEvents.com</span>
          </div>
        </div>
      </footer>
	
</body>
</html>
