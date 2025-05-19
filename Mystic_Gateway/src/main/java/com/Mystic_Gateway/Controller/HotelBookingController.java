package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/HotelBooking" })
public class HotelBookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HotelBookingController() {
        super();
    }

    // Handles GET requests to display the booking page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/BookHotel.jsp").forward(request, response);
    }

    // Handles POST requests to process hotel booking
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if session exists and get customer ID
        HttpSession session = request.getSession(false);
        Integer customerId = (session != null) ? (Integer) session.getAttribute("customerId") : null;

        // If no customer ID in session, redirect to login
        if (customerId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Get form parameters
        String destination = request.getParameter("destination");
        String hotel = request.getParameter("hotel");
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        int guests = 0;
        
        try {
            guests = Integer.parseInt(request.getParameter("guests"));
        } catch (NumberFormatException e) {
            // If guests parameter is not a valid integer, handle it
            request.setAttribute("errorMessage", "Invalid number of guests.");
            request.getRequestDispatcher("/WEB-INF/Pages/BookHotel.jsp").forward(request, response);
            return;
        }

        // Debugging (optional) – remove or replace with logging in production
        System.out.println("Booking Details: ");
        System.out.println("Destination: " + destination);
        System.out.println("Hotel: " + hotel);
        System.out.println("Check-in: " + checkin);
        System.out.println("Check-out: " + checkout);
        System.out.println("Guests: " + guests);

        try {
            // Call service to book the hotel
            boolean success = com.Mystic_Gateway.Service.HotelBookingService.bookHotel(
                customerId, destination, hotel, checkin, checkout, guests
            );

            // If booking is successful, redirect to success page
            if (success) {
                response.sendRedirect("BookingSuccess.jsp");
            } else {
                // If booking fails, set error message and forward back to booking page
                request.setAttribute("errorMessage", "Failed to book hotel.");
                request.getRequestDispatcher("/WEB-INF/Pages/BookHotel.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle any unexpected errors and forward with error message
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/Pages/BookHotel.jsp").forward(request, response);
        }
    }
}
