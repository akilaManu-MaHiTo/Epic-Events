package com.controll.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.SessionManager;

/**
 * Servlet implementation class UserPaymentServlet
 */
@WebServlet("/UserPaymentServlet")
public class UserPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPaymentServlet() {
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
		
	    String totalPriceString = request.getParameter("totalPrice");
        double totalPrice = 0.0; // Initialize to a default value

        try {
            totalPrice = Double.parseDouble(totalPriceString);
        } catch (NumberFormatException e) {
            // Handle the case where the totalPriceString cannot be parsed to a double
            // For example, you might log the error or display a message to the user
            // Here's a simple example of logging the error:
            e.printStackTrace(); // This will print the error to the console
        }

        // Set the payment price in session
        SessionManager.setPaymentPrice(totalPrice);

        // Redirect to paymentDetails.jsp
        response.sendRedirect("paymentForm.jsp");
		
	}

}
