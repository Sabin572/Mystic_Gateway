package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Mystic_Gateway.Config.DBConfig;
import com.Mystic_Gateway.Model.PackageModel;

/**
 * Servlet implementation class SearchProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/SearchProduct" })
public class SearchProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = request.getParameter("packageName");  // match the input name in your form
        List<PackageModel> packageList = new ArrayList<>();

        try (Connection conn = DBConfig.getDbConnection()) {
            String sql = "SELECT id, Resources, destination, duration FROM packages WHERE LOWER(destination) LIKE ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, "%" + destination.toLowerCase() + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                PackageModel p = new PackageModel();
                p.setDestination(rs.getString("destination"));
                p.setResources(rs.getString("Resources"));
                p.setDuration(rs.getInt("duration"));
                packageList.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("searchResults", packageList);
        request.setAttribute("query", destination);
        request.getRequestDispatcher("/WEB-INF/Pages/SearchProduct.jsp").forward(request, response);
    }
}
