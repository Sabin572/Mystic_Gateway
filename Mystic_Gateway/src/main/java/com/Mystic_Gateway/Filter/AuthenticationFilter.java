package com.Mystic_Gateway.Filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/Login";  // Path for the login page
    private static final String REGISTER = "/Signup";  // Path for the sign-up page
    private static final String HOME = "/Home";  // Path for the home page
    private static final String ROOT = "/";  // Path for the root page

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic, if required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();

        // Allow access to static resources like images, CSS, JS
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css") || uri.endsWith(".js")) {
            chain.doFilter(request, response);
            return;
        }

        // Get session attribute for logged-in user
        String username = (String) req.getSession().getAttribute("username");

        // If user is not logged in and tries to access a restricted page
        if (username == null) {
            // Allow access to Login, Register, or Home pages
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
                chain.doFilter(request, response);
            } else {
                // Redirect to Login page if not logged in
                res.sendRedirect(req.getContextPath() + LOGIN);
            }
            return;
        }

        // If user is logged in, allow them to access all pages
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup logic, if required
    }
}
