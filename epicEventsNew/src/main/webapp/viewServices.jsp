<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.database.ServiceData" %>
<%@ page import="com.model.services.Services" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Services</title>
</head>
<body>
    <h1>Services List</h1>
    <table border="1">
        <tr>
            <th>Price</th>
            <th>Description</th>
        </tr>
        <% 
            ServiceData serviceData = new ServiceData();
            List<Services> servicesList = serviceData.getServices();
            for (Services service : servicesList) {
        %>
        <tr>
            <td><%= service.getPrice() %></td>
            <td><%= service.getDescription() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
