package com.controll.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.PaymentData;
import com.model.payment.PaymentDetails;

/**
 * Servlet implementation class UpdatePaymentServlet
 */
@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePaymentServlet() {
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
        String paymentAccept = request.getParameter("paymentAccept");
        
        Integer paymentIdInt = Integer.parseInt(paymentId);
       
        
        

        PaymentDetails updatedpayment = new PaymentDetails();
        
        updatedpayment.setPaymentId(paymentIdInt);
        updatedpayment.setAccept(paymentAccept);
        
        PaymentData payDay = new PaymentData();
        
        try {
        	
        	payDay.updatePayment(updatedpayment);
			
		} catch (ClassNotFoundException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			
			// TODO: handle finally clause
			
		}
        response.getWriter().println("<script>");
        response.getWriter().println("alert('Payament Update Successful');");
        response.getWriter().println("window.location.href = 'updatePayment.jsp';");
        response.getWriter().println("</script>");
        
	}

}
