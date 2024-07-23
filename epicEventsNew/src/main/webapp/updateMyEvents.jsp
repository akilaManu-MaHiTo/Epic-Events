<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.SessionManager" %>
<%@ page import="com.model.plan.BdayPlan" %>
<%@ page import="com.database.EventDetailsData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Details</title>
<!-- title font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Monsieur+La+Doulaise&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">

<!-- Table Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Monsieur+La+Doulaise&family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">


<link rel="stylesheet" type="text/css" href="styles/updateMyevent.css">
</head>
<body>

	<img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul class="list">
            <li><a href="#" class="navibtn">Service Update</a></li>
        </ul>
    </div>

<div class="container">
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Event Date</th>
                <th>Age</th>
                <th>Detail ID</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                EventDetailsData eventdetails = new EventDetailsData();
                List<BdayPlan> eventList = eventdetails.getUserEventDetails();
                for (BdayPlan bday : eventList) {
            %>
            <tr>
                <td><%= bday.getFirstName() %></td>
                <td><%= bday.getLastName() %></td>
                <td><%= bday.getEventdate() %></td>
                <td><%= bday.getAge() %></td>
                <td><%= bday.getDetailId() %></td>
                <td>
                    <div class="button-container">
                        <form action="<%= request.getContextPath() %>/UpdateEventDetailByIdServlet" method="POST">
                            <input type="hidden" name="bdayId" value="<%= bday.getDetailId() %>">
                            <input type="hidden" name="bdayAge" value="<%= bday.getAge() %>">
                            <input type="hidden" name="bdayDate" value="<%= bday.getEventdate() %>">
                            <input type="hidden" name="bdayLastName" value="<%= bday.getLastName() %>">
                            <input type="hidden" name="bdayFirstName" value="<%= bday.getFirstName() %>">
                            <button type="submit" class="animated-button1"> 
                                <span>Update</span>
                                <span></span> 
                            </button>
                        </form>     

                        <form action="<%= request.getContextPath() %>/DeleteEventDetails" method="POST">
                            <input type="hidden" name="bdayId" value="<%= bday.getDetailId() %>">                    
                            <button type="submit" class="animated-button2"> 
                                <span>Delete</span>
                                <span></span> 
                            </button>
                        </form>
                    </div>
                </td>
            </tr>
            <% 
                } 
            %>
        </tbody>
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
