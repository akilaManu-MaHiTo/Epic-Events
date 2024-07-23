package com.controll.plan;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.plan.BdayPlan;


/**
 * Servlet implementation class UpdateEventDetailByIdServlet
 */
@WebServlet("/UpdateEventDetailByIdServlet")
public class UpdateEventDetailByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEventDetailByIdServlet() {
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
		
        String bdayId = request.getParameter("bdayId");
        String bdayAge = request.getParameter("bdayAge");
        String bdayDate = request.getParameter("bdayDate");
        String bdayLastName = request.getParameter("bdayLastName");
        String bdayFirstName = request.getParameter("bdayFirstName");
        
        Integer bdayIdInt = Integer.parseInt(bdayId);
        Integer bdayAgeInt = Integer.parseInt(bdayAge);

        BdayPlan bday = new BdayPlan();
        
        bday.setDetailId(bdayIdInt);
        bday.setAge(bdayAgeInt);
        bday.setEventdate(bdayDate);
        bday.setFirstName(bdayFirstName);
        bday.setLastName(bdayLastName);


        request.setAttribute("birthDay", bday);
        request.getRequestDispatcher("updateEventById.jsp").forward(request, response);
    
	}

}
