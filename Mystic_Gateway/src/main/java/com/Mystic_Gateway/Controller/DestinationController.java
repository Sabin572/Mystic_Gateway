package com.Mystic_Gateway.Controller;  // adjust this package as needed

import com.Mystic_Gateway.Model.PackageModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



@WebServlet("/Destination")
public class DestinationController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/travel-mystic-gateway";
    private static final String DB_USER = "";
    private static final String DB_PASS = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PackageModel> packagesList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM packages")) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PackageModel pkg = new PackageModel();
                pkg.setDestination(rs.getString("destination"));
                pkg.setResources(rs.getString("resources"));
                pkg.setDuration(rs.getInt("duration"));
                packagesList.add(pkg);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        request.setAttribute("packagesList", packagesList);
        request.getRequestDispatcher("/WEB-INF/Pages/Destination.jsp").forward(request, response);
    }
}