package com.controll.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.services.Services;

/**
 * Servlet implementation class UpdateServiceIdServlet
 */
@WebServlet("/UpdateServiceIdServlet")
public class UpdateServiceIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServiceIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String serviceId = request.getParameter("serviceId");
        String serviceDescription = request.getParameter("serviceDep");
        String servicePrice = request.getParameter("servicePrice");
        
        Integer serviceIdInt = Integer.parseInt(serviceId);
        Double servicePriceDouble = Double.parseDouble(servicePrice);

        Services updatedService = new Services();
        updatedService.setServiceId(serviceIdInt);
        updatedService.setDescription(serviceDescription);
        updatedService.setPrice(servicePriceDouble);


        request.setAttribute("service", updatedService);
        request.getRequestDispatcher("updateServiceById.jsp").forward(request, response);
    }

}
