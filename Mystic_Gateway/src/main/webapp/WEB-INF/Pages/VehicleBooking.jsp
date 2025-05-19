<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Mystic Gateway</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/VehicleBooking.css">
</head>
<body>

<header class="navbar">
  <div class="logo">
    <h2><b><i>Mystic GateWay</i></b></h2>
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
  <div class="image-side">
    <img src="${pageContext.request.contextPath}/Resources/vehiclehero.jpg" alt="Vehicle Image">
  </div>
  <div class="form-side">
    <h2>Rent a Vehicle 🚗</h2>
    <form method="post" action="${pageContext.request.contextPath}/BookVehicle">
      <label for="name">Your Name</label>
	  <input type="text" id="name" name="name" placeholder="e.g., Alex Johnson">

      <label for="vehicle">Select Vehicle</label>
      <select id="vehicle" name="vehicle">
        <option>Car</option>
        <option>Bike</option>
        <option>Scooter</option>
        <option>Van</option>
      </select>

      <label for="pickup">Pickup Date</label>
      <input type="date" id="pickup" name="pickup">

      <label for="pickup_location">Pickup Location</label>
      <input type="text" id="pickup_location" name="pickup_location" placeholder="e.g., Lazimpat, Kathmandu">

      <label for="dropoff_location">Drop-off Location</label>
      <input type="text" id="dropoff_location" name="dropoff_location" placeholder="e.g., Thamel, Kathmandu">

      <button type="submit">Rent Now 💙</button>
    </form>
  </div>
</div>

</body>
</html>
