<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
    <meta charset="ISO-8859-1">
    <title>Custom Plan - Graduation</title>
    <link rel="stylesheet" type="text/css" href="styles/order.css">
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
    
    <div class="mainb">
        
        <div class="back_btn">
            <button class="backbtn" onclick="window.location.href='birthday.jsp'">Back</button>
        </div>      
        
        <h6 class="title">Custom Plan - Graduation</h6>
        
        <div>
            <div>
                <div class="lefts">
                    <div class="Lside">
                        <div class="lsub">
                            <h1>Items And Services</h1>
                        </div>
                        <%
                            ServiceData serviceData = new ServiceData();
                            List<Services> servicesList = serviceData.getServices();
                            for (Services service : servicesList) {
                        %>
                        <div class="lopt">
                            <%= service.getDescription() %> &nbsp; &nbsp;&nbsp; &nbsp;  <%= service.getPrice() %>0/=&nbsp; &nbsp; &nbsp; &nbsp;
                            <form action="<%= request.getContextPath() %>/UserAddServices" method="post">
                                <input type="hidden" name="serviceId" value="<%= service.getServiceId() %>">
                                <input type="hidden" name="userId" value="<%= SessionManager.getUsersID() %>">
                                <input type="hidden" name="servicePrice" value="<%= service.getPrice() %>">
                                <input type="hidden" name="detailId" value="<%= SessionManager.getDetailsID() %>">
                                <button type="submit" class="plusbtn">
                                    <span>+</span>
                                </button>
                            </form>
                            <br><br>
                        </div>
                        <%
                            }
                        %>
                        
                        <br><br><br>
                        <h1>Add your Favourite Venue</h1>
                        <br><br><br>
                        <%
                            VenueData venueData = new VenueData();
                            List<Venue> venueList = venueData.getVenue();
                            for (Venue venue : venueList) {
                        %>
                        <div class="lopt">
                            <%= venue.getVenue_name() %> &nbsp; &nbsp;&nbsp; &nbsp;  <%= venue.getPrice() %>0/=&nbsp; &nbsp; &nbsp; &nbsp;
                            <form action="<%= request.getContextPath() %>/UserAddVenueServlet" method="post">
                                <input type="hidden" name="venueId" value="<%= venue.getVenueId() %>">
                                <input type="hidden" name="userId" value="<%= SessionManager.getUsersID() %>">
                                <input type="hidden" name="venuePrice" value="<%= venue.getPrice() %>">
                                <input type="hidden" name="detailId" value="<%= SessionManager.getDetailsID() %>">
                                <button type="submit" class="plusbtn">
                                    <span>+</span>
                                </button>
                            </form>
                            <br><br>
                        </div>
                        <%
                            }
                        %>                  
                    </div>
                    <div class="Rside">                      
                        <div class="rsub">
                            <h1>You Selected</h1>
                        </div>
                        <% 
                            UserServiceData userServiceData = new UserServiceData();
                            List<UserService> userServices = userServiceData.getUserService();
                            for (UserService userservice : userServices) {
                        %>
                        <div class="ropt">
                            <%= userservice.getServiceDetails() %> &nbsp; &nbsp; &nbsp; &nbsp; <%= userservice.getServicePrice() %>0/=&nbsp; &nbsp; &nbsp; &nbsp;
                            <form action="<%= request.getContextPath() %>/DeleteAddedServiceServlet" method="post">
                                <input type="hidden" name="service_Id" value="<%= userservice.getServiceId() %>">
                                <input type="hidden" name="detailId" value="<%= SessionManager.getDetailsID() %>">
                                <button type="submit" class="minusbtn">
                                    <span>-</span>
                                </button>
                            </form>
                        </div>  
                        <% } %>
                        <% 
                            UserVenueData userVenueData = new UserVenueData();
                            List<UserVenue> userVenue = userVenueData.getUserVenue();
                            for (UserVenue uservenue : userVenue) {
                        %>
                        <div class="ropt">
                            <%= uservenue.getVenueName() %> &nbsp; &nbsp; &nbsp; &nbsp; <%= uservenue.getVenuePriceD() %>0/=&nbsp; &nbsp; &nbsp; &nbsp;
                            <form action="<%= request.getContextPath() %>/DeleteAddedVenueServlet" method="post">
                                <input type="hidden" name="venue_Id" value="<%= uservenue.getVenueId() %>">
                                <input type="hidden" name="detailId" value="<%= SessionManager.getDetailsID() %>">
                                <button type="submit" class="minusbtn">
                                    <span>-</span>
                                </button>
                            </form>    
                            <br><br>      
                        </div>
                        <%
                            }
                        %>
                        
                        
                    </div>
                </div>
					<div class="calc">
					    <%
					        UserVenueData uservenuedata = new UserVenueData();
					        UserServiceData userservicedata = new UserServiceData();
					
					        double total = uservenuedata.sumOfVenuePrice() + userservicedata.sumOfServicePrice();
					
					        if (total != 0.00) {
					    %>
					            <form action="<%= request.getContextPath() %>/UserPaymentServlet" method="post">
					                <input type="hidden" id="totalPrice" name="totalPrice" value="<%= total %>" readonly>					              
					                
					                <p class="pricetitle">Total Amount :</p>
					                <p class="card-price"> <span>Rs</span><%= total %>0/=</p>
					                
					                <button type="submit" class="Btn">
									  Pay
									  <svg class="svgIcon" viewBox="0 0 576 512"><path d="M512 80c8.8 0 16 7.2 16 16v32H48V96c0-8.8 7.2-16 16-16H512zm16 144V416c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V224H528zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm56 304c-13.3 0-24 10.7-24 24s10.7 24 24 24h48c13.3 0 24-10.7 24-24s-10.7-24-24-24H120zm128 0c-13.3 0-24 10.7-24 24s10.7 24 24 24H360c13.3 0 24-10.7 24-24s-10.7-24-24-24H248z"></path></svg>
									</button>
					                
					                
									
					            </form>
					    <%
					        }
					    %>
					</div>
            </div>
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
                <a href="myEvents.jsp">Shangri-La</a>
              </li>
              
              <li>
                <a href="updateMyEvents.jsp">events.lk</a>
              </li>
              
              <li>
                <a href="#">prime events</a>
              </li>
              
              <li>
                <a href="">YourEvent</a>
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
