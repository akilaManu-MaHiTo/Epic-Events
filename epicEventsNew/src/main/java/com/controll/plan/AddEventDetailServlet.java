package com.controll.plan;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.EventDetailsData;
import com.model.plan.Birthday;

/**
 * Servlet implementation class AddEventDetailServlet
 */
@WebServlet("/AddEventDetailServlet")
public class AddEventDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEventDetailServlet() {
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
	    // Retrieve data from form fields
	    String firstName = request.getParameter("firstName");
	    String lastName = request.getParameter("lastName");
	    int age = Integer.parseInt(request.getParameter("age"));
	    String date = request.getParameter("date");

	    // Create Birthday instance
	    Birthday birthday = new Birthday(firstName, lastName, date, age);

	    try {
	        EventDetailsData eventdd = new EventDetailsData();
	        
	        eventdd.addEventDetails(birthday);
	        eventdd.getEventDetailId();
	        eventdd.addBirthdayDetails(birthday);
	        
	        response.sendRedirect("ordernew.jsp");
	    } catch (ClassNotFoundException | SQLException e) {
	        // Check if the exception is due to a unique constraint violation
	        if (e instanceof java.sql.SQLIntegrityConstraintViolationException) {
	            // Send JavaScript code to display an alert
	            String alertScript = "<script>alert('This Event Details Already Exist'); window.location='planform1.jsp';</script>";
	            response.getWriter().write(alertScript);
	        } else {
	            e.printStackTrace();
	            response.sendRedirect("planform1.jsp");
	        }
	    }
	}


}
