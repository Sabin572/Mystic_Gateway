<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mystic Gateway</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Services.css">
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
   <div class="title">
    <h1><b>The Leading Nepali Travel Agency in Nepal</b></h1>
  </div>
  <div class="services">
    <h2><b>Our Services</b></h2>
  </div>
  <div class="deal-container">
    <div class="deal-card">
        <a href="BookFlight"><img src="${pageContext.request.contextPath}/Resources/airplane-ticket.png" alt="Flights" width="110px"></a>
        <p>Flight Booking</p>
    </div>
    <div class="deal-card">
      <a href="BookVehicle"><img src="${pageContext.request.contextPath}/Resources/car.png" alt="Flights" width="110px"></a>
      <p>Rent a vehicle</p>
  </div>
    <div class="deal-card">
      <a href="HotelBooking"><img src="${pageContext.request.contextPath}/Resources/city.png" alt="Flights" width="110px"></a>
        <p>Hotels Reservations</p>
    </div>
</div>