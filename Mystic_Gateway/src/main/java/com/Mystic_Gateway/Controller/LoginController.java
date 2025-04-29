package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

import com.Mystic_Gateway.Util.SessionUtil;
import org.mindrot.jbcrypt.BCrypt; // ✅ Make sure you import this

@WebServlet(asyncSupported = true, urlPatterns = { "/Login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_registration";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT * FROM registration WHERE username = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String storedHashedPassword = rs.getString("password");

                    if (BCrypt.checkpw(password, storedHashedPassword)) {
                        // ✅ Password matched, login successful
                        String firstName = rs.getString("first_name");
                        String lastName = rs.getString("last_name");
                        String fullName = firstName + " " + lastName;
                        String email = rs.getString("email");

                        SessionUtil.setUserSession(request, username, fullName, email);

                        request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
                        return;
                    }
                }

                // ❌ If no user found or password mismatch
                request.setAttribute("errorMessage", "Invalid username or password.");
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
