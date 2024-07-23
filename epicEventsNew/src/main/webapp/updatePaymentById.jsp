<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.payment.PaymentDetails" %>
<%@ page import="com.model.SessionManager" %>
<%@ page import="com.database.ServiceData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Service</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Tangerine:wght@400;700&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="styles/updatePaymentById.css">
</head>
<body>
	<img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul class="list">
            <li><a href="#" class="navibtn">Payments</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="form-title">Update Payment</div>
        <%
            PaymentDetails payment = (PaymentDetails) request.getAttribute("PaymentDetails");
        %>
        <form action="UpdatePaymentServlet" method="POST">
		    <div class="form-group">
		    	<label ><b>Payment ID</b></label>
		        <input type="text" name="paymentId" value="<%= payment.getPaymentId() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Payment Amount</b></label>
		        <input type="text" name="paymentPrice" value="<%= payment.getPrice() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Email</b></label>
		        <input type="text" name="paymentEmail" value="<%= payment.getEmail() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Age</b></label>
		        <input type="text" name="paymentAge" value="<%= payment.getAge() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Event</b></label>
		        <input type="text" name="paymentEvent" value="<%= payment.getEventName() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Name</b></label>
		        <input type="text" name="paymentFirstName" value="<%= payment.getFirstName() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Last Name</b></label>
		        <input type="text" name="paymentLastName" value="<%= payment.getLastName() %>" readonly>
		    </div>
		    <div class="form-group">
		    	<label ><b>Status</b></label>
			    <select name="paymentAccept">
			        <option value="accepted" <%= payment.getAccept().equals("accepted") ? "selected" : "" %>>Accepted</option>
			        <option value="rejected" <%= payment.getAccept().equals("rejected") ? "selected" : "" %>>Rejected</option>
			        <option value="pending" <%= payment.getAccept().equals("pending") ? "selected" : "" %>>Pending</option>
			    </select>
			</div>
		    <div class="form-group">
		        <input type="submit" value="Update">
		    </div>
		</form>
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
