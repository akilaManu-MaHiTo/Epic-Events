package com.controll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.UserData;
import com.model.User;

/**
 * Servlet implementation class UpdateMe
 */
@WebServlet("/UpdateMeServlet")
public class UpdateMeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    private UserData userdata = new UserData();
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname = request.getParameter("firstName");
		String lastname = request.getParameter("lastName");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String Email = request.getParameter("email");		
		String password = request.getParameter("pass");
		
		User user = new User();
		user.setEmail(Email);
		user.setFirstName(firstname);
		user.setLastName(lastname);
		user.setAddress(address);
		user.setContact(contact);
		user.setPassword(password);
		
		try {
			
			userdata.updateUser(user);
			
		} catch (ClassNotFoundException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		
		
        response.getWriter().println("<script>");
        response.getWriter().println("alert('Account Update Success');");
        response.getWriter().println("window.location.href = 'home.jsp';");
        response.getWriter().println("</script>");
	}

}
