package com.controll.plan;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.EventDetailsData;
import com.model.plan.BdayPlan;

@WebServlet("/DeleteEventDetails")
public class DeleteEventDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteEventDetails() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // GET requests are not supported in this servlet, redirect to an error page
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String detailIdParam = request.getParameter("bdayId");
        if (detailIdParam == null || detailIdParam.isEmpty()) {
            // Handle the case where bdayId parameter is missing or empty
            redirectToUpdateMyEventsWithAlert(response, "Cannot Delete Event..This Event ID is Missing or Invalid");
            return;
        }

        try {
            int detailId = Integer.parseInt(detailIdParam);
            BdayPlan bday = new BdayPlan();
            bday.setDetailId(detailId);
            EventDetailsData deleteEvent = new EventDetailsData();
            int deletedRows = deleteEvent.deleteEventDetails(bday);

            if (deletedRows == 0) {
                // If no rows were deleted, redirect to planform.jsp with an alert
                redirectToUpdateMyEventsWithAlert(response, "Cannot Delete Event..This Event has Already Been Paid");
                return;
            }
        } catch (SQLException e) {
            // Handle SQL exceptions
            redirectToUpdateMyEventsWithAlert(response, "Database Error: Cannot Delete Event");
            return;
        } catch (NumberFormatException e) {
            // Handle the case where bdayId parameter is not a valid integer
            redirectToUpdateMyEventsWithAlert(response, "Invalid Event ID");
            return;
        }

        // Redirect to the updateMyEvents.jsp page after successful deletion
        response.sendRedirect("updateMyEvents.jsp");
    }

    private void redirectToUpdateMyEventsWithAlert(HttpServletResponse response, String message)
            throws IOException {
        response.getWriter().println("<script>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href = 'updateMyEvents.jsp';");
        response.getWriter().println("</script>");
    }


}
