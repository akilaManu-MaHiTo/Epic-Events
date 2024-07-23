package com.controll.venue;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.VenueData;
import com.model.venue.Venue;

/**
 * Servlet implementation class UpdateVenueServlet
 */
@WebServlet("/UpdateVenueServlet")
public class UpdateVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVenueServlet() {
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
		
        String venueId = request.getParameter("venueId");
        String venueName = request.getParameter("venueName");
        String venueAddress = request.getParameter("venueAddress");
        String venueCapacity = request.getParameter("venueCapacity");
        String venuePrice = request.getParameter("venuePrice");
        
        Integer venueIdInt = Integer.parseInt(venueId);
        Integer venueCapacityInt = Integer.parseInt(venueCapacity);
        Double venuePriceDouble = Double.parseDouble(venuePrice);

        Venue venue = new Venue();
        
        venue.setVenueId(venueIdInt);
        venue.setVenue_name(venueName);
        venue.setAddress(venueAddress);
        venue.setCapacity(venueCapacityInt);
        venue.setPrice(venuePriceDouble);
        
        VenueData venuedata = new VenueData();
        
        
        try {
        	
			venuedata.UpdateVenueDetails(venue);
			
		} catch (ClassNotFoundException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
       
        response.getWriter().println("<script>");
        response.getWriter().println("alert('Venue Updated Success');");
        response.getWriter().println("window.location.href = 'updateVenue.jsp';");
        response.getWriter().println("</script>");
        
	}

}
