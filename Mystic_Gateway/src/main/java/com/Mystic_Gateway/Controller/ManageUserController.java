package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet(asyncSupported = true, urlPatterns = { "/ManageUser" })
public class ManageUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ManageUserController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        
        if ("delete".equals(action)) {
            int customerId = Integer.parseInt(request.getParameter("customer_id"));

            try (
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel-mystic-gateway", "root", "");
                PreparedStatement pstmt = conn.prepareStatement("DELETE FROM customer WHERE customer_id = ?")
            ) {
                Class.forName("com.mysql.cj.jdbc.Driver");

                pstmt.setInt(1, customerId);
                int deleted = pstmt.executeUpdate();

                HttpSession session = request.getSession();
                if (deleted > 0) {
                    session.setAttribute("message", "User deleted successfully.");
                } else {
                    session.setAttribute("message", "User deletion failed.");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.getSession().setAttribute("message", "Error occurred while deleting user.");
            }

            response.sendRedirect(request.getContextPath() + "/ManageUser");
        } else {
            request.getRequestDispatcher("WEB-INF/Pages/ManageUser.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int customerId = Integer.parseInt(request.getParameter("customer_id"));
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String birthday = request.getParameter("birthday");

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // use cj for MySQL 8+
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel-mystic-gateway", "root", "");

                String sql = "UPDATE customer SET first_name = ?, last_name = ?, username = ?, email = ?, phone = ?, birthday = ? WHERE customer_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, firstName);
                pstmt.setString(2, lastName);
                pstmt.setString(3, username);
                pstmt.setString(4, email);
                pstmt.setString(5, phone);
                pstmt.setString(6, birthday);
                pstmt.setInt(7, customerId);

                int updated = pstmt.executeUpdate();
                if (updated > 0) {
                    System.out.println("User updated successfully.");
                } else {
                    System.out.println("User update failed.");
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }

            // After update, redirect to GET to refresh the list
            response.sendRedirect(request.getContextPath() + "/ManageUser");
        } else {
            doGet(request, response);
        }
    }
}