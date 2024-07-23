<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div align="center">
  <h1>Employee Register Form</h1>
  <form action="<%= request.getContextPath() %>/UserServlet" method="post">
   <table style="with: 80%">
   
    <tr>
     <td>First Name</td>
     <td><input type="text" name="firstname" /></td>
    </tr>


    <tr>
     <td>Password</td>
     <td><input type="password" name="pass" /></td>
    </tr>
    <tr>

    <tr>
     <td>Email</td>
     <td><input type="text" name="email" /></td>
    </tr>
   </table>
   
   <input type="submit" value="Submit" />
   
  </form>
 </div>
</body>
</html>