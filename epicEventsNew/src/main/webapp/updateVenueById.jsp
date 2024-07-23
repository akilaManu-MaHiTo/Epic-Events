<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.venue.Venue" %>
<%@ page import="com.model.SessionManager" %>
<%@ page import="com.database.ServiceData" %>
<!DOCTYPE html>
<html>
<head>

<!-- title font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Monsieur+La+Doulaise&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">

<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="styles/updateVenueById.css">
<title>Insert title here</title>
</head>
<body>
		<img src="img/epicEventslogo.png" class="styled-image">
    	<div class="navi">
        <ul class="list">
            <li><a href="#" class="navibtn">Venue</a></li>
        	</ul>
   		</div>

	    <%
        	Venue venues = (Venue) request.getAttribute("venue");
    	%>
		<div class="container">
	    	<div class="box">
				<form action="UpdateVenueServlet" method="POST">
			    <label for="title">
			      <h3><b><br>Venue Update Form</b></h3>
			    </label>
			    
			    <input type="hidden" id="username" name="venueId" value="<%= venues.getVenueId() %>" required></input>
			    
			    <label for="venue_name"><b>Venue Name </b></label>
			    <input type="text" id="username" name="venueName" value="<%= venues.getVenue_name() %>" required></input>
				
				<label for="address"><b>Address </b></label>
			    <input type="text" class="address" id="username" name="venueAddress" value="<%= venues.getAddress() %>" required></input>	
				
				<label for="capacity"><b>Capacity</b></label>
			    <input type="number" id="username" name="venueCapacity" value="<%= venues.getCapacity() %>" required></input>		
				
			    <label for="price"><b>Price<b></label>
			    <input type="text" id="password" name="venuePrice" step="0.01" value="<%= venues.getPrice() %>" required pattern="\d+(\.\d{2})?" title="Please enter a valid pice"  required></input>
			
			    <br>
			    
			    <input type="submit" value="Update Venue" id="submitBtn"></input>
			    </a>
			  </form>
			  <a href="updateVenue.jsp" class="submit_a"></a>
			</div>
	    </div>

</body>
</html>