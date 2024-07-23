package com.controll.venue;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.UserVenueData;
import com.model.venue.UserVenue;

/**
 * Servlet implementation class DeleteAddedVenueServlet
 */
@WebServlet("/DeleteAddedVenueServlet")
public class DeleteAddedVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAddedVenueServlet() {
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
		String serviceIdString = request.getParameter("venue_Id");
		int venueId = Integer.parseInt(serviceIdString);
		
		String detailIdString = request.getParameter("detailId");
		int detailId = Integer.parseInt(detailIdString);
		
		UserVenue uservenue = new UserVenue();
		
		uservenue.setVenueId(venueId);
		uservenue.setDetailId(detailId);
		
		try {
			
		    UserVenueData userVenueData = new UserVenueData();
		    userVenueData.deleteUserVenue(uservenue);
		    response.sendRedirect("ordernew.jsp");
		    
		} catch (ClassNotFoundException | SQLException e) {
			
		    // Handle the exception appropriately, such as logging or showing an error message
		    e.printStackTrace(); // This prints the exception trace, consider logging it instead
		    response.sendRedirect("error.jsp");
		    
		}
	}

}
