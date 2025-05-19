package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.Mystic_Gateway.Service.VehicleBookingService;

@WebServlet(asyncSupported = true, urlPatterns = { "/BookVehicle" })
public class BookVehicle extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BookVehicle() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer customerId = (session != null) ? (Integer) session.getAttribute("customerId") : null;

        if (customerId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/Pages/VehicleBooking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer customerId = (session != null) ? (Integer) session.getAttribute("customerId") : null;
        System.out.println("Customer ID from session: " + customerId);

        if (customerId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Get form inputs
        String name = request.getParameter("name");
        String vehicleType = request.getParameter("vehicle");
        String pickupDate = request.getParameter("pickup");
        String pickupLocation = request.getParameter("pickup_location");
        String dropoffLocation = request.getParameter("dropoff_location");

        try {
            boolean success = VehicleBookingService.bookVehicle(
                    customerId, name, vehicleType, pickupDate, pickupLocation, dropoffLocation
            );

            if (success) {
                response.sendRedirect("BookingSuccess.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to book vehicle.");
                request.getRequestDispatcher("/WEB-INF/Pages/VehicleBooking.jsp").forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/Pages/VehicleBooking.jsp").forward(request, response);
        }
    }
}
