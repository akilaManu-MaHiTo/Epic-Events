<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Caveat:wght@400..700&family=Charm:wght@400;700&family=Charmonman:wght@400;700&family=Cookie&family=Dancing+Script&family=Dosis:wght@200..800&family=Ephesis&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Kalam:wght@300;400;700&family=Miniver&family=Norican&family=Pacifico&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Satisfy&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
<link rel="stylesheet" href="styles/admin.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Loader -->
	<div id="preloader">
  	<div id="loader"></div>
	</div>
<!-- Loader -->

	<img src="img/epicEventslogo.png" class="styled-image">

	<div class="title"> Welcome To Admin </div>
	  
	<div class="container">
	
		<a href="editServices.jsp" class="Dtext ">
			<button class="custom-button service">Services</button>
		</a>
		
		<a href="editVenue.jsp" class="Dtext ">
			<button class="custom-button venue">Venue</button>
		</a>
		
		<a href="editServices.jsp" class="Dtext ">
			<button class="custom-button user">User</button>
		</a>
		
		<a href="updatePayment.jsp" class="Dtext ">
			<button class="custom-button payment">Payment</button>
		</a>
		
		<a href="updatePayment.jsp" class="Dtext ">
		<button class="custom-button event">Event Details</button>
		</a>
		
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