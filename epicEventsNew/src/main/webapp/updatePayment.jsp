<%@ page import="java.util.List" %>
<%@ page import="com.model.payment.PaymentDetails" %>
<%@ page import="com.database.PaymentData" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Payments Details</title>
    
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
<meta charset="ISO-8859-1">

<title>Service Details</title>
<link rel="stylesheet" type="text/css" href="styles/updatePayment.css">
    
</head>
<body>

	<img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul class="list">
            <li><a href="#" class="navibtn">Service Update</a></li>
        </ul>
    </div>

<%
    // Call the method to get user payment details
    
    PaymentData payday = new PaymentData();
    List<PaymentDetails> userPayments = payday.getUserPaymentsDetails();

    // Check if there are any payments
    if (!userPayments.isEmpty()) {
%>
<div class=container>
<table>
    <tr>
        <th>Payment Id</th>
        <th>Price</th>
        <th>Email</th>
        <th>Age</th>
        <th>Event Name</th>
        <th>Venue Name</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Accept</th>
        <th>Detail Id</th>
        <th>User Id</th>
        <th>Update</th>
        <th>Service</th>
    </tr>
    <% for (PaymentDetails payment : userPayments) { %>
    <tr>
        <td><%= payment.getPaymentId() %></td>
        <td><%= payment.getPrice() %></td>
        <td><%= payment.getEmail() %></td>
        <td><%= payment.getAge() %></td>
        <td><%= payment.getEventName() %></td>
        <td><%= payment.getVenuName() %></td>
        <td><%= payment.getFirstName() %></td>
        <td><%= payment.getLastName() %></td>
        <td><%= payment.getAccept() %></td>
        <td><%= payment.getDetailId() %></td>
        <td><%= payment.getUserId() %></td>
        <td> 
            <div class="update-form">
                <form action="UpdatePaymentByIdServlet" method="POST">
                    <input type="hidden" name="paymentId" value="<%= payment.getPaymentId() %>">
                    <input type="hidden" name="paymentPrice" value="<%= payment.getPrice() %>">
                    <input type="hidden" name="paymentEmail" value="<%= payment.getEmail() %>">
                    <input type="hidden" name="paymentAge" value="<%= payment.getAge() %>">
                    <input type="hidden" name="paymentEvent" value="<%= payment.getEventName() %>">
                    <input type="hidden" name="paymentFirstName" value="<%= payment.getFirstName() %>">
                    <input type="hidden" name="paymentLastName" value="<%= payment.getLastName() %>">
                    <input type="hidden" name="paymentAccept" value="<%= payment.getAccept() %>">
                    
                    <button type="submit" class="animated-button1"> 
		            <span>Update</span>
					  <span></span> 
					</button>
                </form>
            </div>
        </td>
        <td>
			<form action="ViewServiceServlet" method="POST">
			
				<input type="hidden" name="detailId" value="<%= payment.getDetailId() %>">
				<input type="hidden" name="userId" value="<%= payment.getUserId() %>">             
				<button class="animated-button2"> 
		            <span>View</span>
					  <span></span> 
					</button>
				
			</form>      	
        </td>
    </tr>
    <% } %>
</table>
</div>

<%
    } else {
%>
    <p>No payments found.</p>
<%
    }
%>

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
