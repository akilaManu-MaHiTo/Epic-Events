package com.controll.venue;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.UserVenueData;
import com.model.venue.UserVenue;

/**
 * Servlet implementation class UserAddVenue
 */
@WebServlet("/UserAddVenueServlet")
public class UserAddVenueSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddVenueSevlet() {
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

		
		String UserId = request.getParameter("userId");
		String VenueId = request.getParameter("venueId");
		String venuePrice = request.getParameter("venuePrice");
		String DetailId = request.getParameter("detailId");

		int userId = Integer.parseInt(UserId);
		int venueId = Integer.parseInt(VenueId);
		int detailId = Integer.parseInt(DetailId);
		
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
		UserVenue uservenue = new UserVenue();

		uservenue.setUserId(userId); 
		uservenue.setVenueId(venueId);
		uservenue.setDetailId(detailId);
		uservenue.setVenuePrice(venuePrice);
		
        try {
        	
            UserVenueData userVenueData = new UserVenueData();
            userVenueData.addUserVenue(uservenue);
            
            response.sendRedirect("ordernew.jsp");
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            // Handle other exceptions here, if needed
            response.getWriter().println("<script>");
	        response.getWriter().println("alert('You already Added this Venue');");
	        response.getWriter().println("window.location.href = 'ordernew.jsp';");
	        response.getWriter().println("</script>");
        }
		
	}
		
}


