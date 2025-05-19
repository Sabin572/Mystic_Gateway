package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

import com.Mystic_Gateway.Util.SessionUtil;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(asyncSupported = true, urlPatterns = { "/Login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/travel-mystic-gateway";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                //  Admin login 
                String adminSql = "SELECT * FROM admin WHERE username = ?";
                try (PreparedStatement adminStmt = conn.prepareStatement(adminSql)) {
                    adminStmt.setString(1, username);
                    ResultSet adminRs = adminStmt.executeQuery();

                    if (adminRs.next()) {
                        String storedAdminPassword = adminRs.getString("password");

                        if (password.equals(storedAdminPassword)) {
                            int adminId = adminRs.getInt("admin_id");
                            String email = adminRs.getString("email");

                            SessionUtil.setUserSession(request, adminId, username, "Admin", email);
                            response.sendRedirect(request.getContextPath() + "/Dashboard");
                            return;
                        } else {
                            request.setAttribute("errorMessage", "Invalid username or password.");
                            request.setAttribute("enteredUsername", username);
                            request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
                            return;
                        }
                    }
                }

                //  Customer login (hashed with BCrypt)
                String customerSql = "SELECT * FROM customer WHERE username = ?";
                try (PreparedStatement customerStmt = conn.prepareStatement(customerSql)) {
                    customerStmt.setString(1, username);
                    ResultSet customerRs = customerStmt.executeQuery();

                    if (customerRs.next()) {
                        String storedPassword = customerRs.getString("password");

                        if (BCrypt.checkpw(password, storedPassword)) {
                            String fullName = customerRs.getString("first_name") + " " + customerRs.getString("last_name");
                            String email = customerRs.getString("email");
                            int customerId = customerRs.getInt("customer_id");

                            SessionUtil.setUserSession(request, customerId, username, fullName, email);
                            request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
                            return;
                        }
                    }
                }

                // ❌ If both admin and customer login fail
                request.setAttribute("errorMessage", "Invalid username or password.");
                request.setAttribute("enteredUsername", username);
                request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "MySQL driver not found: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
        }
    }
}
