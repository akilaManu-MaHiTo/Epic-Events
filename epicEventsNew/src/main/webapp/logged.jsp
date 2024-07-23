<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.SessionManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Page</title>
</head>
<body>

    <c:choose>
        <c:when test="${empty sessionScope.user}">
            <%-- Handle scenario where user attribute is not set or session is null --%>
            <%-- Redirect to login page or display an error message --%>
            <% response.sendRedirect("login.jsp"); %>
        </c:when>
        <c:otherwise>
            <%-- Your HTML content goes here --%>
            <%  
                User user = (User) session.getAttribute("user");
            	int userID = SessionManager.getUsersID();
            %>
            <p>Welcome, User <%= user.getFirstName() %>!</p>
            <p>Email: <%= user.getEmail() %></p>
            <p>ID: <%= userID %></p>
            
            <a href="updateaccount.jsp?userID=<%= userID %>">Update Account</a>
        </c:otherwise>
    </c:choose>
    
    


</body>
</html>
