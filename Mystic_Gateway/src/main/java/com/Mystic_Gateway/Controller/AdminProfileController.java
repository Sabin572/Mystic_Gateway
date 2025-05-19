package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.Mystic_Gateway.Config.DBConfig;

/**
 * Servlet implementation class AdminProfileController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminProfile" })
public class AdminProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");

        try (Connection conn = DBConfig.getDbConnection()) {
            String updateSql = "UPDATE admin SET full_name = ?, email = ? WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                stmt.setString(1, full_name);
                stmt.setString(2, email);
                stmt.setString(3, username);

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
        response.sendRedirect(request.getContextPath() + "/AdminProfile?update=success");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/AdminProfile.jsp").forward(request, response);
    }
}