package com.controll.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.PaymentData;
import com.model.payment.Payment;

/**
 * Servlet implementation class ProcessPaymentServlet
 */
@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcessPaymentServlet() {
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
		
		String cardNo = request.getParameter("cardNumber");
		String cardname = request.getParameter("cardHname");
		String credittype = request.getParameter("credittype");
		String expdate = request.getParameter("year");
		String cvv = request.getParameter("cvv");
		
		Payment pay = new Payment();
		
		pay.setCardNo(cardNo);
		pay.setCreditType(credittype);
		pay.setCvv(cvv);
		pay.setExpDate(expdate);
		pay.setCardHolder(cardname);
		
		try {
			
			PaymentData paydata = new PaymentData();			
			paydata.addPayment(pay);
			
	        response.getWriter().println("<script>");
	        response.getWriter().println("alert('Payment Successful');");
	        response.getWriter().println("window.location.href = 'myEvents.jsp';");
	        response.getWriter().println("</script>");
			
		} catch (ClassNotFoundException e){
			
			e.printStackTrace();
		}
		
				
	}

}
