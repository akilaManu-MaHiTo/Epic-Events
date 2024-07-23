<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List" %>
<%@ page import="com.model.User" %>
<%@ page import="com.database.UserData" %>
<%@ page import="com.model.SessionManager" %>

<%
    // Get the logged-in user's ID from the session manager
    int userID = SessionManager.getUsersID();
    
    // Retrieve the user details based on the user ID
    UserData userData = new UserData();
    List<User> userList = userData.updateUser();
    
    // Assuming only one user is retrieved, you might need to adjust if handling multiple users
    User user = null;
    if (!userList.isEmpty()) {
        user = userList.get(0);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Madimi+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Arizonia&family=League+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="styles/updateacc.css">
    
    <meta charset="ISO-8859-1">
    <title>epic Event home</title>
</head>
<body>
    <img src="img/epicEventslogo.png" class="styled-image">
    <div class="navi">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>

    <h2>User Details</h2>
    <div class="user-details">
        <c:forEach var="user" items="${userList}">
            <div>
                <label>Email:</label>
                <span>${user.getEmail()}</span>
            </div>
            <div>
                <label>First Name:</label>
                <span>${user.getFirstName()}</span>
            </div>
            <div>
                <label>Last Name:</label>
                <span>${user.getLastName()}</span>
            </div>
            <div>
                <label>Address:</label>
                <span>${user.getAddress()}</span>
            </div>
            <div>
                <label>Contact:</label>
                <span>${user.getContact()}</span>
            </div>
        </c:forEach>
    </div>

    <h2>Update Account Details</h2>
    <form class="updateform" action="UpdateMeServlet" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" class="posi" name="email" value="<%= user.getEmail() %>">
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" class="posi" name="firstName" value="<%= user.getFirstName() %>">
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" class="posi" name="lastName" value="<%= user.getLastName() %>">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" class="posi" name="pass" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" class="posi" name="address" value="<%= user.getAddress() %>">
        </div>
        <div class="form-group">
            <label for="contact">Contact:</label>
            <input type="number" id="contact" class="posi" name="contact" value="<%= user.getContact() %>">
        </div>              
        <input type="submit" value="Update">
    </form>

    <h2>Delete Account</h2>
    <form id="deleteForm" action="DeleteUserServlet" method="post">
        <p>Deactivate My Account</p>
        <button type="button" onclick="confirmDelete()">Delete Account</button>
    </form>

    <script>
        function confirmDelete() {
            if (confirm("Are you sure you want to delete your account?")) {
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
</body>
</html>
