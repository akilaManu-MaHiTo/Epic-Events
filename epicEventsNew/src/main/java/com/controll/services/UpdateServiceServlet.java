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
 * Servlet implementation class UpdateServiceServlet
 */
@WebServlet("/UpdateServiceServlet")
public class UpdateServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServiceServlet() {
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
        String serviceId = request.getParameter("serviceId");
        String serviceDescription = request.getParameter("serviceDep");
        String servicePrice = request.getParameter("servicePrice");
        
        Integer serviceIdInt = Integer.parseInt(serviceId);
        Double servicePriceDouble = Double.parseDouble(servicePrice);

        Services updatedService = new Services();
        updatedService.setServiceId(serviceIdInt);
        updatedService.setDescription(serviceDescription);
        updatedService.setPrice(servicePriceDouble);
        
        ServiceData service = new ServiceData();
        
        try {
        	
			service.updateService(updatedService);
			
		} catch (ClassNotFoundException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
        
        response.getWriter().println("<script>");
        response.getWriter().println("alert('Service Updated Success');");
        response.getWriter().println("window.location.href = 'updateService.jsp';");
        response.getWriter().println("</script>");
	}

}
