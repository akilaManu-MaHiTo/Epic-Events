<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.database.PaymentData" %>
<%@ page import="com.model.payment.UserPaymentData" %>
<%@ page import="com.model.SessionManager" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="test.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
    
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
    
 
    <link rel="stylesheet" type="text/css" href="styles/myEvents.css">
    <meta charset="ISO-8859-1">
    <title>Receipts</title>
</head>
<body>

    <img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul class="list">
            <li><a href="User_home.jsp" class="navibtn">Home</a></li>
            <li><a href="#" class="navibtn">About Us</a></li>
            <li><a href="#" class="navibtn">Services</a></li>
            <li><a href="#" class="navibtn">Contact</a></li>
        </ul>
    </div>


<main class="ticket-system">
    <div class="top">
    <h1 class="title">Wait a second, your reciept is being printed</h1>

    <div class="printer" />
    </div>

    <div class="receipts-wrapper">
    <%
    PaymentData paymentData = new PaymentData();
    List<UserPaymentData> userPayments = paymentData.getUserPayments();
    
    for (UserPaymentData payment : userPayments) {
%>
        
       <div class="receipts">

          <div class="receipt">
              <% 
            String eventName = payment.getEventName() != null ? payment.getEventName() : "N/A";
            String paymentPrice = payment.getPaymentPrice() != null ? payment.getPaymentPrice() : "N/A";
            String eventPerson = payment.getEventPerson() != null ? payment.getEventPerson() : "N/A";
            String venueName = payment.getVenueName() != null ? payment.getVenueName() : "N/A";
            String userName = payment.getUserName() != null ? payment.getUserName() : "N/A";
            int paymentId = payment.getPaymentId();
            String payAccept = payment.getAccept();
            
        %>
            
             <span class="sub_title"> epicEvents</span>
             
             <div class="route">
                <h2><%= payAccept %></h2>
             </div>
             <div class="details">
                    <div class="item">
                    <span>Event</span>
                        <h3><%= eventName %></h3>
                    </div>
                    <div class="item">
                    <span>User Name</span>
                        <h3><%= userName %></h3>
                    </div>
                    <div class="item">
                    <span>Guest of honor.</span>
                        <h3><%= eventPerson %></h3>
                    </div>
                    <div class="item">
                    <span>Venue</span>
                        <h3><%= venueName %></h3>
                    </div>
                    <div class="item">
                    <span>Event Cost</span>
                        <h3>Rs.<%= paymentPrice %>/=</h3>
                    </div>
             </div>
             
				<form id="deletePay" action="DeletePaymentServlet" method="POST">
				    <input type="hidden" name="paymentId" value="<%= paymentId %>">
				    
				    <button type="submit" onclick="return confirmDelete()" class="deleteBtn">
				        <span>X</span>
				    </button>
				</form>
				
				<script>
				    function confirmDelete() {
				        return confirm("Are you sure you want to delete your Event Payment?");
				    }
				</script>
          </div>
          <div class="receipt qr-code">
             <svg class="qr" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 29.938 29.938">
                <path d="M7.129 15.683h1.427v1.427h1.426v1.426H2.853V17.11h1.426v-2.853h2.853v1.426h-.003zm18.535 12.83h1.424v-1.426h-1.424v1.426zM8.555 15.683h1.426v-1.426H8.555v1.426zm19.957 12.83h1.427v-1.426h-1.427v1.426zm-17.104 1.425h2.85v-1.426h-2.85v1.426zm12.829 0v-1.426H22.81v1.426h1.427zm-5.702 0h1.426v-2.852h-1.426v2.852zM7.129 11.406v1.426h4.277v-1.426H7.129zm-1.424 1.425v-1.426H2.852v2.852h1.426v-1.426h1.427zm4.276-2.852H.002V.001h9.979v9.978zM8.555 1.427H1.426v7.127h7.129V1.427zm-5.703 25.66h4.276V22.81H2.852v4.277zm14.256-1.427v1.427h1.428V25.66h-1.428zM7.129 2.853H2.853v4.275h4.276V2.853zM29.938.001V9.98h-9.979V.001h9.979zm-1.426 1.426h-7.127v7.127h7.127V1.427zM0 19.957h9.98v9.979H0v-9.979zm1.427 8.556h7.129v-7.129H1.427v7.129zm0-17.107H0v7.129h1.427v-7.129zm18.532 7.127v1.424h1.426v-1.424h-1.426zm-4.277 5.703V22.81h-1.425v1.427h-2.85v2.853h2.85v1.426h1.425v-2.853h1.427v-1.426h-1.427v-.001zM11.408 5.704h2.85V4.276h-2.85v1.428zm11.403 11.405h2.854v1.426h1.425v-4.276h-1.425v-2.853h-1.428v4.277h-4.274v1.427h1.426v1.426h1.426V17.11h-.004zm1.426 4.275H22.81v-1.427h-1.426v2.853h-4.276v1.427h2.854v2.853h1.426v1.426h1.426v-2.853h5.701v-1.426h-4.276v-2.853h-.002zm0 0h1.428v-2.851h-1.428v2.851zm-11.405 0v-1.427h1.424v-1.424h1.425v-1.426h1.427v-2.853h4.276v-2.853h-1.426v1.426h-1.426V7.125h-1.426V4.272h1.426V0h-1.426v2.852H15.68V0h-4.276v2.852h1.426V1.426h1.424v2.85h1.426v4.277h1.426v1.426H15.68v2.852h-1.426V9.979H12.83V8.554h-1.426v2.852h1.426v1.426h-1.426v4.278h1.426v-2.853h1.424v2.853H12.83v1.426h-1.426v4.274h2.85v-1.426h-1.422zm15.68 1.426v-1.426h-2.85v1.426h2.85zM27.086 2.853h-4.275v4.275h4.275V2.853zM15.682 21.384h2.854v-1.427h-1.428v-1.424h-1.427v2.851zm2.853-2.851v-1.426h-1.428v1.426h1.428zm8.551-5.702h2.853v-1.426h-2.853v1.426zm1.426 11.405h1.427V22.81h-1.427v1.426zm0-8.553h1.427v-1.426h-1.427v1.426zm-12.83-7.129h-1.425V9.98h1.425V8.554z"/>
             </svg>
             <div class="description">
                <h2>epicEvents.com</h2>
                <p>Show QR-code when requested</p>
             </div>
          </div>
       </div>
    </div>
    <%
    }
    %>
 </main>
 
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