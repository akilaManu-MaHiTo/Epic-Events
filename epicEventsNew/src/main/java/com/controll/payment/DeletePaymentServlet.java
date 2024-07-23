package com.controll.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.PaymentData;

import com.model.payment.UserPaymentData;

/**
 * Servlet implementation class DeletePaymentServlet
 */
@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePaymentServlet() {
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
		
		String stringId = request.getParameter("paymentId");
		int paymentId = Integer.parseInt(stringId);

		UserPaymentData delPay = new UserPaymentData();
		
		delPay.setPaymentId(paymentId);

		
		try {
			
			PaymentData paydata = new PaymentData();			
			paydata.deletePayment(delPay);
			
			response.sendRedirect("myEvents.jsp");
			
		} catch (ClassNotFoundException e){
			
			e.printStackTrace();
		}
	}

}
