package com.controll.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.services.UserService;
import com.database.UserServiceData;

/**
 * Servlet implementation class UserAddServices
 */
@WebServlet("/UserAddServices")
public class UserAddServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddServices() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String UserId = request.getParameter("userId");
		String ServiceId = request.getParameter("serviceId");
		String ServicePrice = request.getParameter("servicePrice");
		String DetailId = request.getParameter("detailId");

		int userId = Integer.parseInt(UserId);
		int serviceId = Integer.parseInt(ServiceId);
		int detailId = Integer.parseInt(DetailId);
		

		UserService userservice = new UserService();

		userservice.setUserId(userId); 
		userservice.setServiceId(serviceId);
		userservice.setDetailId(detailId);
		userservice.setServicePrice(ServicePrice);
		
		try {
		    UserServiceData userservicedata = new UserServiceData();
		    userservicedata.addUserService(userservice);
		    
		    response.sendRedirect("ordernew.jsp");
		    
		} catch (Exception e) {
		    e.printStackTrace();
		    // Handle the exception here, if needed
		    
	        response.getWriter().println("<script>");
	        response.getWriter().println("alert('You Already Added this Services');");
	        response.getWriter().println("window.location.href = 'ordernew.jsp';");
	        response.getWriter().println("</script>");
		}
		
	}

}
