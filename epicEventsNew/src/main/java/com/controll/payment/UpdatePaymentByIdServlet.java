package com.controll.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.payment.PaymentDetails;


/**
 * Servlet implementation class UpdatePaymentByIdServlet
 */
@WebServlet("/UpdatePaymentByIdServlet")
public class UpdatePaymentByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePaymentByIdServlet() {
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
        String paymentId = request.getParameter("paymentId");
        String paymentEmail = request.getParameter("paymentEmail");
        String paymentPrice = request.getParameter("paymentPrice");
        String paymentAge = request.getParameter("paymentAge");
        String paymentEvent = request.getParameter("paymentEvent");
        String paymentFirstName = request.getParameter("paymentFirstName");
        String paymentLastName = request.getParameter("paymentLastName");
        String paymentAccept = request.getParameter("paymentAccept");
        
        Integer paymentIdInt = Integer.parseInt(paymentId);
        Integer paymentAgeInt = Integer.parseInt(paymentAge);
        
        

        PaymentDetails updatedpayment = new PaymentDetails();
        
        updatedpayment.setPaymentId(paymentIdInt);
        updatedpayment.setEmail(paymentEmail);
        updatedpayment.setPrice(paymentPrice);
        updatedpayment.setAge(paymentAgeInt);
        updatedpayment.setEventName(paymentEvent);
        updatedpayment.setFirstName(paymentFirstName);
        updatedpayment.setLastName(paymentLastName);
        updatedpayment.setAccept(paymentAccept);


        request.setAttribute("PaymentDetails", updatedpayment);
        request.getRequestDispatcher("updatePaymentById.jsp").forward(request, response);
	}

}
