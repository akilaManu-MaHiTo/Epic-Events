<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.database.VenueData" %>
<%@ page import="com.model.venue.Venue" %>
<%@ page import="com.model.SessionManager" %>

<!DOCTYPE html>
<html>
<head>

<!-- title font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Monsieur+La+Doulaise&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">

<!-- Table Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Monsieur+La+Doulaise&family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="styles/updateVenue.css">
<meta charset="ISO-8859-1">
<title>Venue Details</title>

</head>
<body>

	<img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul class="list">
            <li><a href="#" class="navibtn">Service Update</a></li>
        </ul>
    </div>

<div class="container">
<table border="1">
    <tr>
      <th>Venue Id</th>
      <th>Venue Name</th>
      <th>Venue Address</th>
      <th>Venue Capacity</th>
      <th>Venue Price</th>
      <th>Action</th>
    </tr>
    <%
        VenueData venueData = new VenueData();
        List<Venue> venueList = venueData.getVenue();
        for (Venue venue : venueList) {
    %>
    <tr>
      <td><%= venue.getVenueId() %></td>
      <td><%= venue.getVenue_name() %></td>
      <td><%= venue.getAddress() %></td>
      <td><%= venue.getCapacity() %></td>
      <td><%= venue.getPrice() %>0</td>
        <td>
          <form action="<%= request.getContextPath() %>/UpdateVenueIdServlet" method="POST">
			
            <input type="hidden" name="venueId" value="<%= venue.getVenueId() %>">
            <input type="hidden" name="venueName" value="<%= venue.getVenue_name() %>">
            <input type="hidden" name="venueAddress" value="<%= venue.getAddress() %>">
            <input type="hidden" name="venueCapacity" value="<%= venue.getCapacity() %>">
            <input type="hidden" name="venuePrice" value="<%= venue.getPrice() %>" >
            
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
