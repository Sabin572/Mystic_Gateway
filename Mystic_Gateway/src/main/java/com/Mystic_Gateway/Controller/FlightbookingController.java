package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

import com.Mystic_Gateway.Service.FlightBookingService;

@WebServlet(asyncSupported = true, urlPatterns = { "/BookFlight" })
public class FlightbookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FlightbookingController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer customerId = (session != null) ? (Integer) session.getAttribute("customerId") : null;

        if (customerId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/Pages/FlightBooking.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer customerId = (session != null) ? (Integer) session.getAttribute("customerId") : null;

        if (customerId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        // Now safe to parse parameters
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String date = request.getParameter("date");
        String travelClass = request.getParameter("class");

        int passengers = 1;
        try {
            passengers = Integer.parseInt(request.getParameter("passengers"));
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number of passengers.");
            request.getRequestDispatcher("/WEB-INF/Pages/FlightBooking.jsp").forward(request, response);
            return;
        }

        try {
            boolean success = FlightBookingService.bookFlight(customerId, from, to, date, travelClass, passengers);
            if (success) {
                System.out.println("Successfull");
            } else {
                request.setAttribute("errorMessage", "Failed to book flight.");
                request.getRequestDispatcher("/WEB-INF/Pages/FlightBooking.jsp").forward(request, response);
                System.out.println("Failed to book flight");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/Pages/FlightBooking.jsp").forward(request, response);
        }
    }
}
