package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name="addtocart",urlPatterns= {"/addtocart"})
public class addtocart extends HttpServlet{
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession se=request.getSession();
		Registration reg = new Registration(se);
		try {
			if (se.getAttribute("uname") != null && request.getParameter("bookevent") != null) {
                String status = reg.Booknow(request);
                if (status.equals("success")) {
                    request.setAttribute("status", "Booking successful.<a href='Eventstatus.jsp'>Click here</a> to check status.");
                    RequestDispatcher rd = request.getRequestDispatcher("EventBooking.jsp?event_id=" + request.getParameter("event_id"));
                    rd.forward(request, response);
                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Booking failed");
                    RequestDispatcher rd = request.getRequestDispatcher("EventBooking.jsp?event_id=" + request.getParameter("event_id"));
                    rd.forward(request, response);
                } else if (status.equals("existed")) {
                    request.setAttribute("status", "Date not available for event");
                    RequestDispatcher rd = request.getRequestDispatcher("EventBooking.jsp?event_id=" + request.getParameter("event_id"));
                    rd.forward(request, response);
                }
            }


else if (se.getAttribute("uname") != null && request.getParameter("cancelevent") != null) {
                int event_id = Integer.parseInt(request.getParameter("event_id"));
                int status = reg.deleteEvent(event_id);
                if (status > 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("Eventstatus.jsp");
                    rd.forward(request, response);
                }
            }
else if (se.getAttribute("uname") != null && request.getParameter("cancelevent") != null) {
    int event_id = Integer.parseInt(request.getParameter("event_id"));
    int status = reg.deleteevent(event_id);
    if (status > 0) {
        RequestDispatcher rd = request.getRequestDispatcher("Eventstatus.jsp");
        rd.forward(request, response);
    }
}

else if (se.getAttribute("uname") != null && request.getParameter("admincancelevent") != null) {
    int event_id = Integer.parseInt(request.getParameter("event_id"));
    int status = reg.deleteevent(event_id);
    if (status > 0) {
        RequestDispatcher rd = request.getRequestDispatcher("BookedEvents.jsp");
        rd.forward(request, response);
    }
}

else if (se.getAttribute("uname") != null && se.getAttribute("id").equals("1") && request.getParameter("acceptevent") != null) {
    int event_id = Integer.parseInt(request.getParameter("event_id"));
    int status = reg.acceptevent(event_id);
    if (status > 0) {
        RequestDispatcher rd = request.getRequestDispatcher("BookedEvents.jsp");
        rd.forward(request, response);
    }
}




		}catch(Exception e) {
			e.printStackTrace();
	}
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

}
