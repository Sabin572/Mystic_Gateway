<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Mystic Gateway</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/BookHotel.css">
</head>
</head>
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
</head>
<body>
<div class="container">
  <div class="image-side">
    <img src="${pageContext.request.contextPath}/Resources/Hotel.jpg" alt="Cute Hotel">
  </div>
  <div class="form-side">
    <h2>Book Your Hotel 🏨</h2>
    <form method="post" action="${pageContext.request.contextPath}/HotelBooking">
      <label for="destination">Destination</label>
      <select id="destination" name="destination" onchange="updateHotels()">
        <option value="Kathmandu">Kathmandu</option>
        <option value="Pokhara">Pokhara</option>
        <option value="Lumbini">Lumbini</option>
        <option value="Chitwan">Chitwan</option>
      </select>

      <label for="hotel">Select Hotel</label>
      <select id="hotel" name="hotel">
      </select>

      <label for="checkin">Check-in Date</label>
      <input type="date" id="checkin" name="checkin">

      <label for="checkout">Check-out Date</label>
      <input type="date" id="checkout" name="checkout">

      <label for="guests">Guests</label>
      <input type="number" id="guests" name="guests" min="1" value="1">

      <button type="submit">Book Now ✨</button>
    </form>
  </div>
</div>

<script>
  const hotelOptions = {
    Kathmandu: ['Hotel Yak & Yeti', 'Hotel Annapurna', 'The Dwarika\'s Hotel'],
    Pokhara: ['Temple Tree Resort', 'Fish Tail Lodge', 'The Pavilions Himalayas'],
    Lumbini: ['Hotel Kasai', 'Lumbini Buddha Garden', 'Buddha Maya Garden Hotel'],
    Chitwan: ['Barahi Jungle Lodge', 'Green Park Resort', 'Safari Narayani Hotel']
  };

  function updateHotels() {
    const destination = document.getElementById('destination').value;
    const hotelSelect = document.getElementById('hotel');

    hotelSelect.innerHTML = '';
    hotelOptions[destination].forEach(hotel => {
      const option = document.createElement('option');
      option.text = hotel;
      option.value = hotel;
      hotelSelect.add(option);
    });
  }

  // Initialize on page load
  window.onload = updateHotels;
</script>

</body>
</html>
