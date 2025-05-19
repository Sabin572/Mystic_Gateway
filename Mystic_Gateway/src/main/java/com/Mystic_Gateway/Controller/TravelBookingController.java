package com.Mystic_Gateway.Controller;

import com.Mystic_Gateway.Service.TravelBookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/TravelBooking")
public class TravelBookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private TravelBookingService travelBookingService;

    @Override
    public void init() throws ServletException {
        super.init();
        travelBookingService = new TravelBookingService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String place = req.getParameter("place");
        String image = req.getParameter("image");

        req.setAttribute("place", place);
        req.setAttribute("image", image);

        req.getRequestDispatcher("/WEB-INF/Pages/TravelBooking.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Integer customerId = (session != null) ? (Integer) session.getAttribute("customerId") : null;

        if (customerId == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        String destination = req.getParameter("destination");
        String mode = req.getParameter("mode");
        int duration;

        try {
            duration = Integer.parseInt(req.getParameter("duration"));
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid duration input.");
            req.getRequestDispatcher("/WEB-INF/Pages/TravelBooking.jsp").forward(req, resp);
            return;
        }

        try {
            boolean success = travelBookingService.bookTravel(customerId, destination, duration, mode);

            if (success) {
                resp.sendRedirect(req.getContextPath() + "/BookingSuccess.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/BookingError.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/BookingError.jsp");
        }
    }
}
