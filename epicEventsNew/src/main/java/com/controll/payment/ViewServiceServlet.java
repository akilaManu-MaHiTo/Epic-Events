package com.controll.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.PaymentData;
import com.model.payment.ServicePayment;

/**
 * Servlet implementation class ViewServiceServlet
 */
@WebServlet("/ViewServiceServlet")
public class ViewServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServiceServlet() {
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
		
		String stringDId = request.getParameter("detailId");
		int intDId = Integer.parseInt(stringDId);

		String stringUId = request.getParameter("userId");
		int intUId = Integer.parseInt(stringUId);
		
		
		ServicePayment sp = new ServicePayment();
		
		sp.setDetailId(intDId);
		sp.setUserId(intUId);
		
		PaymentData pd = new PaymentData();
		try {
			pd.viewServices();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(sp.getDetailId());
		System.out.println(sp.getUserId());
		response.sendRedirect("userServices.jsp");
			

	}

}
