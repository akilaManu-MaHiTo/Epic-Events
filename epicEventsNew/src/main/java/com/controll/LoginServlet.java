package com.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.UserData;
import com.model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);

        try {
            UserData userData = new UserData();
            boolean userFound = userData.loggedUser(user);
            boolean adminFound = userData.adminLogging(user);

            if (userFound) {
                // Fetch user details from the database
                User userDetails = userData.getUserDetailsByEmail(email);
               

                // Store the user details in the session
                HttpSession session = request.getSession();
                session.setAttribute("user", userDetails);

                response.sendRedirect("User_home.jsp");
                
            } else if(adminFound){
            	
                response.sendRedirect("admin.jsp");
                
            }else {
            	
    	        response.getWriter().println("<script>");
    	        response.getWriter().println("alert('Email or Password Not Match');");
    	        response.getWriter().println("window.location.href = 'home.jsp';");
    	        response.getWriter().println("</script>");
            	
            }
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            
	        response.getWriter().println("<script>");
	        response.getWriter().println("alert('Email or Password Not Match');");
	        response.getWriter().println("window.location.href = 'home.jsp';");
	        response.getWriter().println("</script>");
        }
    }


}
