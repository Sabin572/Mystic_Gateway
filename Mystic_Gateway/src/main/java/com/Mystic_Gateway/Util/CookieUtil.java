package com.Mystic_Gateway.Util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieUtil {

    // Method to retrieve a cookie by its name
    public static Cookie getCookie(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    return cookie;
                }
            }
        }
        return null; // Return null if the cookie is not found
    }

    // Method to add or update a cookie
    public static void addCookie(HttpServletResponse response, String name, String value, int expiryTimeInSeconds) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(expiryTimeInSeconds);  // Set cookie expiration time
        cookie.setPath("/");  // Ensure the cookie is available to the whole site
        response.addCookie(cookie);
    }

    // Method to delete a cookie
    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);  // Set cookie age to 0 to delete it
        cookie.setPath("/");  // Ensure it's deleted across the site
        response.addCookie(cookie);
    }

    // Utility method to check if the role cookie exists
    public static String getRoleFromCookie(HttpServletRequest request) {
        Cookie roleCookie = getCookie(request, "role");
        if (roleCookie != null) {
            return roleCookie.getValue();  // Return the role value (e.g., "admin" or "user")
        }
        return null;  // Return null if role cookie is not found
    }
}
