package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.*;

@WebServlet(asyncSupported = true, urlPatterns = {"/Packages"})
@MultipartConfig
public class ManagePackagesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/travel-mystic-gateway";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            handleDelete(request, response);
        } else {
            request.getRequestDispatcher("WEB-INF/Pages/ManagePackages.jsp").forward(request, response);
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM packages WHERE id = ?")) {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            pstmt.setInt(1, id);
            int deleted = pstmt.executeUpdate();

            if (deleted > 0) {
                session.setAttribute("message", "Package deleted successfully.");
            } else {
                session.setAttribute("message", "Package not found or already deleted.");
            }
        } catch (Exception e) {
            session.setAttribute("message", "Database error occurred while deleting package.");
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/Packages");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            handleUpdate(request, response);
        } else {
            doGet(request, response);
        }
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        String destination = request.getParameter("destination");
        String duration = request.getParameter("duration");
        String oldImage = request.getParameter("oldResources");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Handle file upload
            Part filePart = request.getPart("Resources");
            String fileName = oldImage; // Default to old image
            
            if (filePart != null && filePart.getSize() > 0) {
                // Upload new image
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "Resources";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                filePart.write(uploadPath + File.separator + fileName);
            }

            // Update database
            String sql = "UPDATE packages SET destination = ?, duration = ?, Resources = ? WHERE id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, destination);
                pstmt.setString(2, duration);
                pstmt.setString(3, fileName);
                pstmt.setInt(4, id);

                int updated = pstmt.executeUpdate();
                if (updated > 0) {
                    session.setAttribute("message", "Package updated successfully.");
                } else {
                    session.setAttribute("message", "Package update failed.");
                }
            }
        } catch (Exception e) {
            session.setAttribute("message", "Error occurred while updating package.");
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/Packages");
    }
}