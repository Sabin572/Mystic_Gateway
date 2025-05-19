<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mystic Gateway</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Login.css">
</head>
<body>
    <header>
        <div class="logo">
      <h2><b><I> Mystic GateWay</I></b></h2>
    </div>
        <nav>
            <a href="${pageContext.request.contextPath}/Signup">Sign up</a>
            <a href="#">Sign in</a>
        </nav>
    </header>    

    <div class="container">
        <div class="image-section">
            <img src="${pageContext.request.contextPath}/Resources/travelling01.jpg" alt="Travel Image">
        </div>
        <div class="form-section">
            <h2>Login Form</h2>
            <p>Enter Your Valid Credentials to enter.</p>
         <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                String successMessage = (String) request.getAttribute("successMessage");
                if (errorMessage != null) {
            %>
                <p class="error-message"><%= errorMessage %></p>
            <% } else if (successMessage != null) { %>
                <p class="success-message"><%= successMessage %></p>
            <% } %>
         
            <form method="post" action="<%= request.getContextPath() %>/Login">
                <div class="form-row">
                    <div class="form-group">
                        <label>Username:</label>
                        <input type="text" name="username" value="${param.username}" required>
                    </div>
                    </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password" required>
                    </div>
                    </div>
               <button type="submit" onclick="return validateForm()">Submit</button>
                <div class="button-p">
                    <h3>Don't have an account? <a href="${pageContext.request.contextPath}/Signup">Create Account </a> now!</h3>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <p>@2021 Your Company</p>
    </footer>
</body>
</html>
