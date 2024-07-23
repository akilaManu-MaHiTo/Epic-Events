package com.controll.services;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.UserServiceData;
import com.model.services.UserService;

/**
 * Servlet implementation class DeleteAddedServiceServlet
 */
@WebServlet("/DeleteAddedServiceServlet")
public class DeleteAddedServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAddedServiceServlet() {
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
		// TODO Auto-generated method stub
		
		String serviceIdString = request.getParameter("service_Id");
		int serviceId = Integer.parseInt(serviceIdString);
		
		String detailIdString = request.getParameter("detailId");
		int detailId = Integer.parseInt(detailIdString);
		
		UserService userservice = new UserService();
		
		userservice.setServiceId(serviceId);
		userservice.setDetailId(detailId);
		
		try {
			
		    UserServiceData userServiceData = new UserServiceData();
		    userServiceData.deleteUserService(userservice);
		    response.sendRedirect("ordernew.jsp");
		    
		} catch (ClassNotFoundException | SQLException e) {
			
		    // Handle the exception appropriately, such as logging or showing an error message
		    e.printStackTrace(); // This prints the exception trace, consider logging it instead
		    response.sendRedirect("error.jsp");
		    
		}

		
		
	}

}
