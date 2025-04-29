package com.Mystic_Gateway.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.Mystic_Gateway.Config.DBConfig;
import java.sql.ResultSet;

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
            response.sendRedirect(request.getContextPath() + "/Login"); // Redirect to login if not logged in
            return;
        }

        // Retrieve the user's current data from the database and display it
        try (Connection conn = DBConfig.getDbConnection()) {
            String sql = "SELECT first_name, last_name, username, birthday, phone, email FROM registration WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

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

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        // Forward to the JSP to display user profile
        request.getRequestDispatcher("/WEB-INF/Pages/MyProfile.jsp").forward(request, response);
    }

    // Handle POST request to update the user's profile
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/Login"); // Redirect to login if not logged in
            return;
        }

        // Get the updated profile data from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");

        try (Connection conn = DBConfig.getDbConnection()) {
            // Prepare SQL to update the user's profile in the database
            String sql = "UPDATE registration SET first_name = ?, last_name = ?, phone = ?, birthday = ? WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, phone);
            stmt.setString(4, birthday);
            stmt.setString(5, username);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                // If update was successful, set a success message
                request.setAttribute("successMessage", "Profile updated successfully!");
            } else {
                // If no rows were updated, set an error message
                request.setAttribute("errorMessage", "Failed to update profile.");
            }

            // Re-fetch the updated user data
            String fetchSql = "SELECT first_name, last_name, username, birthday, phone, email FROM registration WHERE username = ?";
            PreparedStatement fetchStmt = conn.prepareStatement(fetchSql);
            fetchStmt.setString(1, username);

            ResultSet rs = fetchStmt.executeQuery();

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

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        // Forward to the JSP after updating profile data
        request.getRequestDispatcher("/WEB-INF/Pages/MyProfile.jsp").forward(request, response);
    }
}
