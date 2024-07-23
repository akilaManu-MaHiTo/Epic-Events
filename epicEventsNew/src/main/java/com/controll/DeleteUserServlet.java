package com.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.UserData;
import com.model.SessionManager;
import com.model.User;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user ID from the session or wherever you store it
        int userID = SessionManager.getUsersID(); // Assuming you have a SessionManager class to manage user sessions
        
        // Delete the user account
        UserData userData = new UserData();
        User deletedUser = null;
        
		try {
			
			deletedUser = userData.deleteUserContact(userID);
			deletedUser = userData.deleteUser(userID);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if (deletedUser != null) {
            // Account deleted successfully
            // Redirect to a confirmation page or perform any other actions
            response.sendRedirect("home.jsp");
        } else {
            // Account deletion failed
            // Redirect to an error page or perform any other actions
            response.sendRedirect("deleteAccountFailed.jsp");
        }
    }

}
