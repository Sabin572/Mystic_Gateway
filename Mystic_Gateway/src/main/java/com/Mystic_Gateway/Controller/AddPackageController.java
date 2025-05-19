package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(asyncSupported = true, urlPatterns = {"/AddPackage"})
@MultipartConfig
public class AddPackageController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "Resources";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/Pages/AddPackage.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destination = request.getParameter("destination");
        String duration = request.getParameter("duration");

        Part part = request.getPart("image");
        if (part == null || part.getSize() == 0) {
            request.getSession().setAttribute("error", "No image file selected.");
            response.sendRedirect(request.getContextPath() + "/AddPackage");
            return;
        }

        String fileName = part.getSubmittedFileName();

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Creates all non-existent directories
        }

        String filePath = uploadPath + File.separator + fileName;
        part.write(filePath);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/travel-mystic-gateway", "root", "");

            String sql = "INSERT INTO packages (destination, duration, Resources) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, destination);
            pstmt.setString(2, duration);
            pstmt.setString(3, fileName);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Failed to add package.");
            response.sendRedirect(request.getContextPath() + "/AddPackage");
            return;
        }

        request.getSession().setAttribute("message", "Package added successfully.");
        response.sendRedirect(request.getContextPath() + "/Packages");
    }
}
