package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(asyncSupported = true, urlPatterns = {"/Booking"})
public class BookingController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public BookingController() {
        super();
    }

    // Show booking list page on GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/Pages/Booking.jsp").forward(request, response);
    }

    // Handle status update on POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdStr = request.getParameter("booking_id");
        String status = request.getParameter("status");

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (bookingIdStr != null && status != null) {
            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                int bookingId = Integer.parseInt(bookingIdStr);

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel-mystic-gateway", "root", "");

                String sql = "UPDATE booking SET status = ? WHERE booking_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, status);
                stmt.setInt(2, bookingId);

                int updated = stmt.executeUpdate();

                if (updated > 0) {
                    out.write("success");
                } else {
                    out.write("fail");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.write("error");
            } finally {
                try {
                    if (stmt != null) {
                        stmt.close();
                
                    }} catch (Exception ignored) {
                }
                try {
                    if (conn != null) {
                        conn.close();
                
                    }} catch (Exception ignored) {
                }
            }
        } else {
            out.write("fail");
        }
    }
}
