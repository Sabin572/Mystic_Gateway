<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/MyProfile.css">
    </head>
<body>
  <header class="navbar">
    <div class="logo">
      <h2><b><I> Mystic GateWay</I></b></h2>
    </div>
    <nav class="nav-links">
      <a href="${pageContext.request.contextPath}/Home">Home</a>
      <a href="${pageContext.request.contextPath}/Destination">Destinations</a>
      <a href="${pageContext.request.contextPath}/Services">Services</a>
      <a href="${pageContext.request.contextPath}/Blog">Blog</a>
      <a href="${pageContext.request.contextPath}/AboutUs">About Us</a>
      <a href="${pageContext.request.contextPath}/ContactUs">Contact Us</a>
      <a href="${pageContext.request.contextPath}/MyProfile">My Profile</a>
    </nav>
  </header>

  <div class="container">
        <header>
            <div class="profile-header">
                
                <div class="user-info">
                   <h1>${firstName} ${lastName}</h1>
            
                    <div class="stats">
                        <div class="stat-item">
                            <i class="fas fa-passport"></i>
                            <span>${totalFlights} Flights</span>
                        </div>
                        <div class="stat-item">
                            <i class="fas fa-medal"></i>
                            <span>Gold Member</span>
                        </div>
                        <div class="stat-item">
                            <i class="fas fa-coins"></i>
                            <span>4,250 Points</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

            <div class="content-area">
                <div class="card">
                    <div class="card-header">
                        <h2>Personal Information</h2>
                        <a href="#">Edit</a>
                    </div>
                    <form action="${pageContext.request.contextPath}/MyProfile" method="POST">
    <div class="form-group">
        <label>First Name</label>
        <input type="text" name="firstName" class="form-control" value="${firstName}">
    </div>
    <div class="form-group">
        <label>Last Name</label>
        <input type="text" name="lastName" class="form-control" value="${lastName}">
    </div>
    <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" class="form-control" value="${email}" readonly>
        <small class="text-success"><i class="fas fa-check-circle"></i> Verified</small>
    </div>
    <div class="form-group">
        <label>Phone Number</label>
        <input type="tel" name="phone" class="form-control" value="${phone}">
    </div>
    <div class="form-group">
        <label>Date of Birth</label>
        <input type="date" name="birthday" class="form-control" value="${birthday}">
    </div>
    <button type="submit" class="btn">Save Changes</button>
</form>
                    
                </div>

                <div class="card">
                    <div class="card-header">
                        <h2>Trending Trips</h2>
                        <a href="${pageContext.request.contextPath}/Destination">View All</a>
                    </div>
                    <div class="trip-card">
                        <img src="https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Bali" class="trip-image">
                        <div class="trip-info">
                            <h3>Bali Island Adventure</h3>
                            <div class="trip-meta">
                                <span><i class="fas fa-calendar-alt"></i> Jun 15-25, 2023</span>
                                <span><i class="fas fa-users"></i> 2 Adults</span>
                                <span><i class="fas fa-hotel"></i> Luxury Villa</span>
                            </div>
                           
                        </div>
                    </div>
                    <div class="trip-card">
                        <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Paris" class="trip-image">
                        <div class="trip-info">
                            <h3>Romantic Paris Getaway</h3>
                            <div class="trip-meta">
                                <span><i class="fas fa-calendar-alt"></i> Sep 1-8, 2023</span>
                                <span><i class="fas fa-users"></i> 2 Adults</span>
                                <span><i class="fas fa-hotel"></i> Boutique Hotel</span>
                            </div>
                           
                        </div>
                    </div>
                </div>

                
            </div>
        </div>

</body>
</html>