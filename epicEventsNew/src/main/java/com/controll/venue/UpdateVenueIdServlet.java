package com.controll.venue;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.venue.Venue;

/**
 * Servlet implementation class UpdateVenueIdServlet
 */
@WebServlet("/UpdateVenueIdServlet")
public class UpdateVenueIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVenueIdServlet() {
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

        Venue updatedVenue = new Venue();
        
        updatedVenue.setVenueId(venueIdInt);
        updatedVenue.setVenue_name(venueName);
        updatedVenue.setAddress(venueAddress);
        updatedVenue.setCapacity(venueCapacityInt);
        updatedVenue.setPrice(venuePriceDouble);


        request.setAttribute("venue", updatedVenue);
        request.getRequestDispatcher("updateVenueById.jsp").forward(request, response);
    }
	

}
