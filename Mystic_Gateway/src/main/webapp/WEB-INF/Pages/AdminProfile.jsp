<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/MyProfile.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Booking.css">
</head>
<body>
  <div class="header">Mystic Gateway</div>

  <div class="dashboard-container">
    <aside class="sidebar">
      <h2>Travel</h2>
      <ul>
        <li><a href="${pageContext.request.contextPath}/Dashboard">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/Booking">Bookings</a></li>
        <li><a href="${pageContext.request.contextPath}/ManageUser">Manage Users</a></li>
        <li><a href="${pageContext.request.contextPath}/Packages">Manage Packages</a></li>
        <li><a href="${pageContext.request.contextPath}/AdminProfile">My Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/Login">Log out</a></li>
      </ul>
    </aside>

<div class="container">
    <header>
        <div class="profile-header">
            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Admin" class="avatar">
            <div class="user-info">
                <h1>${fullName}</h1>
                <div class="stats">
                    <div class="stat-item"><i class="fas fa-user-shield"></i><span>Admin</span></div>
                </div>
            </div>
        </div>
    </header>

    <div class="content-area">
        <div class="card">
            <div class="card-header">
                <h2>Admin Information</h2>
            </div>
            <form action="${pageContext.request.contextPath}/AdminProfile" method="POST">
    <div class="form-group">
        <label>Full Name</label>
        <input type="text" name="full_name" value="${full_name}" required>
    </div>
    <div class="form-group">
        <label>Username</label>
        <input type="text" name="username" value="${username}" readonly>
    </div>
    <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" value="${email}" required>
    </div>
    <button type="submit" class="btn">Update Profile</button>
</form>

        </div>
    </div>
</div>
</div>
<style> 

.sidebar {
height: auto;
}

</style>
</body>
</html>
