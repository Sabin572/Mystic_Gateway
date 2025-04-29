package com.Mystic_Gateway.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {

    // Set user details in session with a 2-minute inactivity timeout
    public static void setUserSession(HttpServletRequest request, String username, String fullname, String email) {
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("fullname", fullname);
        session.setAttribute("email", email);

        // Set session timeout (in seconds) for inactivity - 2 minutes
        session.setMaxInactiveInterval(120); // 120 seconds = 2 minutes
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

    // Get the fullname from the session
    public static String getFullname(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? (String) session.getAttribute("fullname") : null;
    }

    // Get the email from the session
    public static String getEmail(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? (String) session.getAttribute("email") : null;
    }
}
