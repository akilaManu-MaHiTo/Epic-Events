<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%@ page import="com.model.SessionManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.User" %>
<%@ page import="com.database.UserData" %>
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
		
		<!-- loader fonts -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Monsieur+La+Doulaise&display=swap" rel="stylesheet">
				
        <!--Body Fonts-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Josefin+Sans:ital,wght@1,100..700&family=Parisienne&family=Public+Sans:ital,wght@0,100..900;1,100..900&family=Sacramento&family=Tangerine:wght@400;700&family=Zeyada&display=swap" rel="stylesheet">
	
    <link rel="stylesheet" type="text/css" href="styles/user_home.css">
    <meta charset="ISO-8859-1">
    <title>epic Event home</title>
    
	</head>
<body>
	
	<div id="preloader">
	  <img src="img/epicEventslogo.png" class="styled-image" id="loader-image">
	  <span class="Ltext">Loging In.... </span>
	</div>
	
    <img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="Aboutus.jsp">About Us</a></li>
            <li><a href="updateMyEvents.jsp">My Events</a></li>
            <li><a href="myEvents.jsp">My Plans</a></li>
        </ul>
    </div>
   
   <div class="position"> 
    <div class="slideshow-container">       
		<div class="container">
  			<div class="text">
    			<p>Love it, Live it, Plan it</p>
  			</div>
		</div>


        <div class="slide fade">
            <img src="img/slide 1.jpg" alt="Slide 1">
        </div>
        <div class="slide fade">
            <img src="img/slide10.jpg" alt="Slide 2">
        </div>
        <div class="slide fade">
            <img src="img/slide 4.jpg" alt="Slide 3">
        </div>
        <div class="slide fade">
            <img src="img/slide 7.png" alt="Slide 4">
        </div>
    </div>
    </div>

    <div>
    	<div>
    		<img src="img/bday1.jpg" class="bday">	
    	</div>
    	<div class="btext">
    		Are you searching for the perfect way to celebrate your upcoming birthday? 
    		Look no further! Our expert event planners are here to make your special day 
    		one to remember.
    	</div>
    	
   	  	<div>
    		<img src="img/grad.jpg" class="gday">	
    	</div>
    	<div class="gtext">
			Your hard work has paid off, and now it's time to celebrate! Whether you're graduating 
			from high school, college, or any other educational 
			milestone.
    	</div>
    </div>
    
<%
    // Get the logged-in user's ID from the session manager
    int userID = SessionManager.getUsersID();
    
    // Retrieve the user details based on the user ID
    UserData userData = new UserData();
    List<User> userList = userData.updateUser();
%>    

<%
    // Assuming only one user is retrieved, you might need to adjust if handling multiple users
    User user = null;
    if (!userList.isEmpty()) {
        user = userList.get(0);
    }
%>

<%-- Loop through the userList to display only the first names --%>
<% for (User users : userList) { %>
    <div class="welcome-container">
        <a href="update.jsp?userID=${userID}">
            <span class="welcome-message">Hello,&nbsp;&nbsp;${user.getFirstName()}</span>
            <span class="icon fas fa-user-circle fa-lg"></span>           
        </a>
    </div>
<% } %>

        
<div class="event-list">
    <% 
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/epicevents", "root", "akila");

            
            String query = "SELECT * FROM event";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            
            while(resultSet.next()) {
                String eventName = resultSet.getString("event_name");
                String eventImg = resultSet.getString("event_img");
                String eventDep = resultSet.getString("event_dep");
                String link = resultSet.getString("link");
                int adminId = resultSet.getInt("admin_id");

               
                out.println("<div class=\"event red\">");
                out.println("<div class=\"event-image\"><img src='" + eventImg + "'></div>");
                out.println("<div class=\"event-name\">" + eventName + "</div>");                
                out.println("<div class=\"event-description\">Event Description: " + eventDep + "</div>");
                out.println("<button class=\"custom-btn event-link\" onclick=\"window.location.href='" + link + "'\">Book Now</button>");        
                out.println("</div>");
            }
        } catch (Exception e) {
            //e.printStackTrace();
        } finally {
            
            try {
                if(resultSet != null) resultSet.close();
                if(statement != null) statement.close();
                if(connection != null) connection.close();
            } catch (SQLException e) {
                //e.printStackTrace();
            }
        }
    %>
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
      
		<div class="overlay">
		    <div class="popup">
		        <div class="close-btn">&times;</div>
		        <div class="form">
		            <h2>Sign Up</h2>
		            <form action="<%= request.getContextPath() %>/UserServlet" method="post">
		                <div class="form-Element">
		                    <label for="firstName">First Name</label>
		                    <input type="text" required id="firstName" name="firstName">
		                </div>
		                <div class="form-Element">
		                    <label for="lastName">Last Name</label>
		                    <input type="text" required id="lastName" name="lastName">
		                </div>
		                <div class="form-Element">
		                    <label for="email">Email</label>
		                    <input type="email" required id="email" name="email">
		                </div>
		                <div class="form-Element">
		                    <label for="contact">Contact</label>
		                    <input type="text" required id="contact" name="contact" pattern="[0-9]{10}">
		                </div>
		                <div class="form-Element">
		                    <label for="address">Address</label>
		                    <textarea rows="4" required id="address" name="address"></textarea>
		                </div>
		                <div class="form-Element">
		                    <label for="password">Password</label>
		                    <input type="password" required id="password" name="pass">
		                </div>
		                <div class="form-Element">
		                    <label for="rePassword">Re-enter Password</label>
		                    <input type="password" required id="rePassword" name="rePassword">
		                </div>
		                <input type="submit" value="Sign Up" id="submitBtn">
		            </form>
		        </div>
		    </div>
		</div>
		
		<div class="overlay1">
		    <div class="popup1">
		        <div class="close-btn1">&times;</div>
		        <div class="form1">
		            <h2>Login</h2>
		            <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
		                <div class="form-Element1">
		                    <label for="email">Email</label>
		                    <input type="email" required id="email" name="email">
		                </div>
		                <div class="form-Element1">
		                    <label for="password">Password</label>
		                    <input type="password" required id="password" name="pass">
		                </div>
		                <input type="submit" value="Login" id="loginBtn">
		            </form>
		        </div>
		    </div>
		</div>
		


	<script src="JS/home.js"></script>
      
</body>
</html>
