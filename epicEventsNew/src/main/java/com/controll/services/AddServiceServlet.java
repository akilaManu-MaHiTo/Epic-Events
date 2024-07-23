package com.controll.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.ServiceData;
import com.model.services.Services;


/**
 * Servlet implementation class AddServiceServlet
 */
@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServiceServlet() {
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
	    // doGet(request, response); // No need to call doGet within doPost

	    String description = request.getParameter("serviceDescription");
	    String priceStr = request.getParameter("servicePrice");
	    double price = 0.00; // Initializing price with 0.00

	    if (priceStr != null && !priceStr.isEmpty()) {
	        try {
	            // Parsing priceStr to a double
	            price = Double.parseDouble(priceStr);
	            
	        } catch (NumberFormatException e) {
	            // Handle invalid input if needed
	            e.printStackTrace(); // Print stack trace for debugging
	        }
	    }

	    Services service = new Services();
	    service.setPrice(price);
	    service.setDescription(description);

	    try {
	        ServiceData servicedata = new ServiceData();
	        servicedata.addService(service);

	        response.getWriter().println("<script>");
	        response.getWriter().println("alert('Add Services Success');");
	        response.getWriter().println("window.location.href = 'editServices.jsp';");
	        response.getWriter().println("</script>");
	    } catch (ClassNotFoundException e) {
	        // Handle ClassNotFoundException if needed
	        e.printStackTrace();
	    }
	}
	
}



