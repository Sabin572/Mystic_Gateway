package com.Mystic_Gateway.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Mystic_Gateway.Config.DBConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/MyProfile" })
public class MyProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET request to fetch user data and display profile
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        try (Connection conn = DBConfig.getDbConnection()) {

            // Fetch user info and set as request attributes
            setUserAttributes(request, username, conn);

            // Fetch customer ID using username
            String customerId = null;
            String getIdSql = "SELECT customer_id FROM customer WHERE username = ?";
            try (PreparedStatement idStmt = conn.prepareStatement(getIdSql)) {
                idStmt.setString(1, username);
                try (ResultSet idRs = idStmt.executeQuery()) {
                    if (idRs.next()) {
                        customerId = idRs.getString("customer_id");
                    }
                }
            }

            // Count total flights booked by user
            int totalFlights = 0;
            if (customerId != null) {
                String flightSql = "SELECT COUNT(*) AS total FROM flight_bookings WHERE customer_id = ?";
                try (PreparedStatement flightStmt = conn.prepareStatement(flightSql)) {
                    flightStmt.setString(1, customerId);
                    try (ResultSet flightRs = flightStmt.executeQuery()) {
                        if (flightRs.next()) {
                            totalFlights = flightRs.getInt("total");
                        }
                    }
                }
            }

            request.setAttribute("totalFlights", totalFlights);

            // Handle success message after update
            if ("success".equals(request.getParameter("update"))) {
                request.setAttribute("successMessage", "Profile updated successfully!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/Pages/MyProfile.jsp").forward(request, response);
    }

    // Handle POST request to update the user's profile
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");

        try (Connection conn = DBConfig.getDbConnection()) {
            String updateSql = "UPDATE customer SET first_name = ?, last_name = ?, phone = ?, birthday = ? WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, phone);
                stmt.setString(4, birthday);
                stmt.setString(5, username);

                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated == 0) {
                    request.setAttribute("errorMessage", "Failed to update profile.");
                    doGet(request, response); // Reload profile with error
                    return;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            doGet(request, response); // Reload profile with error
            return;
        }

        // Redirect to GET with success message
        response.sendRedirect(request.getContextPath() + "/MyProfile?update=success");
    }

    // Utility method to fetch user profile data
    private void setUserAttributes(HttpServletRequest request, String username, Connection conn) throws SQLException {
        String sql = "SELECT first_name, last_name, username, birthday, phone, email FROM customer WHERE username = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    request.setAttribute("firstName", rs.getString("first_name"));
                    request.setAttribute("lastName", rs.getString("last_name"));
                    request.setAttribute("username", rs.getString("username"));
                    request.setAttribute("birthday", rs.getString("birthday"));
                    request.setAttribute("phone", rs.getString("phone"));
                    request.setAttribute("email", rs.getString("email"));
                } else {
                    request.setAttribute("errorMessage", "User not found.");
                }
            }
        }
    }
}
