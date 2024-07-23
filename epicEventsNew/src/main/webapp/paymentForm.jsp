<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credit Card Form</title>
    <link href="https://fonts.googleapis.com/css?family=Lato|Liu+Jian+Mao+Cao&display=swap" rel="stylesheet">
    <!--Navigation Bar fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Caveat:wght@400..700&family=Charm:wght@400;700&family=Cookie&family=Dancing+Script&family=Ephesis&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Kalam:wght@300;400;700&family=Norican&family=Pacifico&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Caveat:wght@400..700&family=Charm:wght@400;700&family=Charmonman:wght@400;700&family=Cookie&family=Dancing+Script&family=Ephesis&family=Freehand&family=Josefin+Sans:ital,wght@1,100..700&family=Kalam:wght@300;400;700&family=Norican&family=Pacifico&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Satisfy&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Tangerine:wght@400;700&display=swap" rel="stylesheet">
	
<meta charset="UTF-8">
<title>Credit Card Payment</title>
<link rel="stylesheet" type="text/css" href="styles/paymentForm.css">
</head>
<body>
    <div class="header">
		<img src="img/epicEventslogo.png" class="styled-image">
	    <div class="navi">
	        <ul class="list">
	            <li><a href="#" class="navibtn">Home</a></li>
	            <li><a href="#" class="navibtn">About Us</a></li>
	            <li><a href="#" class="navibtn">Services</a></li>
	            <li><a href="#" class="navibtn">Contact</a></li>
	        </ul>
	    </div>
	</div>

<!-- Loader -->
	<div id="preloader">
  	<div id="loader"></div>
	</div>
<!-- Loader -->

    
    <div class="container" >
    <span class="proceedtitle">Proceed to payment.......</span>
        
        <section class="card" id="card">

            <div class="front">

                <div class="brand-logo" id="brand-logo">
                     <img src="img/epicEventslogo.png" alt="logo" class="card-logo">
                </div>


                <img src="https://raw.githubusercontent.com/falconmasters/formulario-tarjeta-credito-3d/master/img/chip-tarjeta.png" class="chip">


                <div class="details">

                    <div class="group" id="number">
                        <p class="label">Card Number</p>
						<p class="number">#### #### #### ####</p>
                    </div>


                    <div class="flexbox">


                        <div class="group" id="name">
                            <p class="label"> Card's Holder </p>
                            <p class="name">Epic Customer</p>
                        </div>

                        <div class="group" id="expiration">
                            <p class="label">Expiration</p>
                            <p class="expiration"> <span class="month">MM</span> / <span class="year">YY</span> </p>
                        </div>


                    </div>

                </div>

            </div>


            <div class="back">


                <div class="magnetic-bar"></div>


                <div class="details">

                    <div class="group" id="signature">
                        <p class="label">Signature</p>
                        <div class="signature">
                            <p></p>
                        </div>
                    </div>


                    <div class="group" id="ccv">
                        <p class="label">CCV</p>
                        <p class="ccv"></p>
                    </div>

                </div>
                

                <p class="legend">This card belongs to epicPayments and should be returned immediately if found or requested to do so. It is not transferable or assignable and may be revoked by the Bank anytime without notice. All operations relating to this card are governed by the Terms and Conditions of the Bank.
</p>
                <a href="#" class="bank-link">www.epicPayments.com</a>

            </div>


        </section>


        <!-- Container Button to open the form -->
        <div class="container-btn">
            <button class="btn-open-form" id="btn-open-form">
            <i class="arrow down"></i>
            </button>
        </div>


        <!-- Form -->
        <form action="ProcessPaymentServlet" id="card-form" class="card-form" method="post" required>

            <div class="group">
                <label for="inputNumber">Card Number</label>
                <input type="text" id="inputNumber" name="cardNumber" maxlength="19" autocomplete="off" required>
            </div>

            <div class="group">
                <label for="inputHolder">Card's Holder Name</label>
                <input type="text" id="inputHolder" name="cardHname" maxlength="19" autocomplete="off" required>
            </div>


            <div class="flexbox">

                <div class="group expire">

                    <label for="selectMonth">Expiration</label>
                    
                    <div class="flexbox">

                        <div class="group-select">

                            <select name="month" id="selectMonth">
                                <option disabled selected> Month </option>                                
                            </select>

                            <i class="fas fa-angle-down"></i>

                        </div>


                        <div class="group-select">

                            <select name="year" id="selectYear" >
                                <option disabled selected> Year </option>
                            </select>

                            <i class="fas fa-angle-down"></i>

                        </div>

                    </div>

                </div>


                <div class="group ccv">
                    <label for="inputCCV">CVV</label>
                    <input type="text" id="inputCCV" name="cvv" maxlength="3" required>
                </div>


            </div>

            <button type="submit" class="Btn"> Pay Now </button>

        </form>

    </div>
    

    <script src="JS/paymentForm.js"></script>

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