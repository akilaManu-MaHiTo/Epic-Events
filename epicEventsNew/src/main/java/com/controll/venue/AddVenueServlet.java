package com.controll.venue;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.venue.Venue;
import com.database.VenueData;

/**
 * Servlet implementation class AddVenueServlet
 */
@WebServlet("/AddVenueServlet")
public class AddVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVenueServlet() {
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
		
	    String venueName = request.getParameter("venue_name");
	    String venueAddress = request.getParameter("address");
	    String capacitystr = request.getParameter("capacity");
	    String VenuePrice = request.getParameter("price");
	    double price = 0.00;
	    int capacity = 0;
	   
	    if (VenuePrice != null && !VenuePrice.isEmpty()) {
	        try {
	            // Parsing priceStr to a double
	            price = Double.parseDouble(VenuePrice);
	            capacity = Integer.parseInt(capacitystr);
	            
	            
	        } catch (NumberFormatException e) {
	            // Handle invalid input if needed
	            e.printStackTrace(); // Print stack trace for debugging
	        }
	    }

	    Venue venue = new Venue();
	    venue.setVenue_name(venueName);
	    venue.setAddress(venueAddress);
	    venue.setCapacity(capacity);
	    venue.setPrice(price);
	    

	    try {
	    	
	        VenueData venuedata = new VenueData();
	        venuedata.addVenueDetails(venue);

	        response.getWriter().println("<script>");
	        response.getWriter().println("alert('Venue Added Success');");
	        response.getWriter().println("window.location.href = 'editVenue.jsp';");
	        response.getWriter().println("</script>");
	    } catch (ClassNotFoundException e) {
	        // Handle ClassNotFoundException if needed
	        e.printStackTrace();
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
