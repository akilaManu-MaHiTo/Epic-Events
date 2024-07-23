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
	 <!--Navigation Bar fonts-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
	 <!--Form fonts-->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Caveat:wght@400..700&family=Charm:wght@400;700&family=Dancing+Script&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Kalam:wght@300;400;700&family=Norican&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
		<meta charset="ISO-8859-1">
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Caveat:wght@400..700&family=Charm:wght@400;700&family=Cookie&family=Dancing+Script&family=Ephesis&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Kalam:wght@300;400;700&family=Norican&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="styles/planform1.css">
		
<title>Insert title here</title>
</head>
<body>
<body>
    <img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul class="list">
            <li><a href="#" class="navibtn">Home</a></li>
            <li><a href="#" class="navibtn">About Us</a></li>
            <li><a href="#" class="navibtn">Services</a></li>
            <li><a href="#" class="navibtn">Contact</a></li>
        </ul>
    </div>
    
    <form action="AddEventDetailServlet" method="post">
		   <div >
			  <div class="bothS">
			   	<h1>Custom Plan - Birthday</h1>
				<div class="inptext">      					
					<div class="left-side">
					
                    	<h5>First Name</h5>
                    	<input type="text" placeholder="  Enter the first name" pattern="[A-Za-z]+"  class="ftext talign" name="firstName" required>
                    	
                    	<h5>Event date</h5>
                    	<input type="date"  class="evttext talign marA" name="date" required>
                    	
                    	
                    	
                	</div>
                	<div class="right-side">
                		<h5>Last Name</h5>
                    	<input type="text" placeholder="  Enter the last Name"  pattern="[A-Za-z]+"  class="ftext talign marA" name="lastName" required>
                    	
                    	<h5>Age</h5>
						<input type="number" class="agetxt talign" name="age" required min="0" max="120">

                    	
                	</div>
				</div>			
				
		   	<button type="submit" class="subbtn">Submit</button>
		   	</div>	
		   		
		   	</div>
		   	
		   	
   		</form>
   		
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