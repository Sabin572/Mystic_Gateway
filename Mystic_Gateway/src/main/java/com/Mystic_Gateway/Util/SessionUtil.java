package com.Mystic_Gateway.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {


    // Set session for Admin
    public static void setAdminSession(HttpServletRequest request, int adminId, String username, String fullName, String email) {
        HttpSession session = request.getSession();
        session.setAttribute("adminId", adminId);
        session.setAttribute("username", username);
        session.setAttribute("email", email);
        session.setAttribute("fullName", fullName);
        session.setMaxInactiveInterval(900); // 18 minutes
    }
    
 // Set session for Customer
    public static void setUserSession(HttpServletRequest request, int customerId, String username, String fullName, String email) {
        HttpSession session = request.getSession();
        session.setAttribute("customerId", customerId);
        session.setAttribute("username", username);
        session.setAttribute("fullName", fullName);
        session.setAttribute("email", email);
        session.setMaxInactiveInterval(1200); // 20 minutes
    }

    // Destroy session (for logout)
    public static void destroySession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    // Check if user is logged in
    public static boolean isUserLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null && session.getAttribute("username") != null);
    }

    // Get the username from the session
    public static String getUsername(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? (String) session.getAttribute("username") : null;
    }

    // Get the full name from the session
    public static String getFullname(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? (String) session.getAttribute("fullName") : null;
    }

    // Get the email from the session
    public static String getEmail(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? (String) session.getAttribute("email") : null;
    }

    // Get the user type (admin or customer)
    public static String getUserType(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? (String) session.getAttribute("userType") : null;
    }

    // Get the customer ID (if customer)
    public static Integer getCustomerId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null && session.getAttribute("customerId") != null)
            ? (Integer) session.getAttribute("customerId") : null;
    }

    // Get the admin ID (if admin)
    public static Integer getAdminId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null && session.getAttribute("adminId") != null)
            ? (Integer) session.getAttribute("adminId") : null;
    }
}
