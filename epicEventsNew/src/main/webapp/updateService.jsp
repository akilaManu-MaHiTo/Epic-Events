<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List" %>
<%@ page import="com.database.ServiceData" %>
<%@ page import="com.model.services.Services" %>
<%@ page import="com.model.venue.Venue" %>
<%@ page import="com.model.venue.UserVenue" %>
<%@ page import="com.database.UserServiceData" %>
<%@ page import="com.model.services.UserService" %>
<%@ page import="com.database.VenueData" %>
<%@ page import="com.database.UserVenueData" %>
<%@ page import="com.model.SessionManager" %>
    
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Madimi+One&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="footer.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Concert+One&family=Pacifico&display=swap" rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Afacad:ital,wght@0,400..700;1,400..700&family=Concert+One&family=Pacifico&display=swap" rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Arizonia&family=League+Script&display=swap" rel="stylesheet">
      
      <!--Navigation Bar fonts-->
      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">

<!--Log in fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Charm:wght@400;700&family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Norican&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Charm:wght@400;700&family=Dancing+Script&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Norican&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Caveat:wght@400..700&family=Charm:wght@400;700&family=Dancing+Script&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Norican&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Caveat:wght@400..700&family=Charm:wght@400;700&family=Dancing+Script&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Kalam:wght@300;400;700&family=Norican&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">

      <!--Body Fonts-->
      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">


<meta charset="ISO-8859-1">
<title>Service Details</title>
<link rel="stylesheet" type="text/css" href="styles/updateService.css">
</head>
<body>
	<img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul class="list">
            <li><a href="#" class="navibtn">Service Update</a></li>
        </ul>
    </div>
<div class=container>
<table border="1">
    <tr>
        <th>Service ID</th>
        <th>Service Description</th>
        <th>Service Price</th>        
        <th>Action</th>
    </tr>
    <%
        ServiceData serviceData = new ServiceData();
        List<Services> servicesList = serviceData.getServices();
        for (Services service : servicesList) {
    %>
    <tr>
      <td><%= service.getServiceId() %></td>
      <td><%= service.getDescription() %></td>
      <td><%= service.getPrice() %>0</td>
        <td>
          <form action="<%= request.getContextPath() %>/UpdateServiceIdServlet" method="POST">
			
            <input type="hidden" name="serviceId" value="<%= service.getServiceId() %>">
            <input type="hidden" name="serviceDep" value="<%= service.getDescription() %>">
            <input type="hidden" name="servicePrice" value="<%= service.getPrice() %>">
            
            <button type="submit" class="animated-button"> 
            <span>Update</span>
			  <span></span> 
			</button>
        </form>
        </td>
    </tr>
    <% } %>
</table>

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
