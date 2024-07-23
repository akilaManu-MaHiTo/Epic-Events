package com.controll.plan;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.EventDetailsData;
import com.model.plan.BdayPlan;

/**
 * Servlet implementation class UpdateEventDetailServlet
 */
@WebServlet("/UpdateEventDetailServlet")
public class UpdateEventDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEventDetailServlet() {
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
        
        int detailId = Integer.parseInt(request.getParameter("detailId"));
        int detailAge = Integer.parseInt(request.getParameter("detailAge"));
        
        String detailDate = request.getParameter("detailDate");
        String detailFname = request.getParameter("detailFname");
        String detailLname = request.getParameter("detailLname");
        
        if(detailAge > 120) {
        	
            response.getWriter().println("<script>");
            response.getWriter().println("alert('Invalid Age');");
            response.getWriter().println("window.location.href = 'updateMyEvents.jsp';");
            response.getWriter().println("</script>");   	
        }
        // Update the event details
        BdayPlan bday = new BdayPlan();
        bday.setDetailId(detailId);
        bday.setAge(detailAge);
        bday.setEventdate(detailDate);
        bday.setFirstName(detailFname);
        bday.setLastName(detailLname);
        
        EventDetailsData updateEvent = new EventDetailsData();
        
        updateEvent.updateEventDetails(bday);
        
        response.getWriter().println("<script>");
        response.getWriter().println("alert('Event Details Update Success');");
        response.getWriter().println("window.location.href = 'updateMyEvents.jsp';");
        response.getWriter().println("</script>");
	}

}
