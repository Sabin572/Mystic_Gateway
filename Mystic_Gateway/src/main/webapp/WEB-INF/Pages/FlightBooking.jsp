<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Mystic Gateway</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/Blog.css">
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
  <style>
    @charset "UTF-8";
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body, html {
  height: 100%;
  font-family:Tahoma, Verdana, sans-serif;
}

.logo h2 {
display:inline;
padding-left: 2rem;
color: black;
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #6200ea; 
  padding: 20px 40px;
}

/* Navigation links */
.nav-links a {
  color: black;
  text-decoration: none;
  padding-right: 1.5rem;
  font-weight: bold;
  font-size: 1.09rem;
  transition: color 0.3s ease;
}

.nav-links a:hover {
  color: yellow;
}

.headingcontainer {
  width: 90%;
  padding-left: 23rem;
  padding-top:15px;
  justify-content:center;
}

/* Header styles */
header {
  background-color: #004080;
  color: #fff;
  padding: 20px 0;
}

header h1 {
  text-align: center;
  margin-bottom: 10px;
}

.container {
    align-items: center;
    display: flex;
    justify-content: center;
    background-color: #ffffff;
    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    width: 100%;
    }

    .image-side {
      flex: 1;
      background: #fdf4ff;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .image-side img {
      max-width: 100%;
      height: auto;
    }

    .form-side {
      flex: 1;
      background-color: #fff;
      padding: 40px;
    }

    .form-side h2 {
      margin-bottom: 20px;
      color: #1210ad;
      font-weight: bold;
      font-size: 28px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin: 10px 0 5px;
      font-size: 14px;
      color: #333;
    }

    input, select {
      padding: 10px;
      border-radius: 10px;
      border: 1px solid #ccc;
      font-size: 14px;
      margin-bottom: 10px;
    }

    button {
      margin-top: 20px;
      background-color: #6519e8;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 20px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #ed8c0d;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
      }
      .image-side, .form-side {
        width: 100%;
      }
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="image-side">
      <img src="https://cdn-icons-png.flaticon.com/512/201/201623.png" alt="Cute Airplane">
    </div>
    <div class="form-side">
      <h2>Book Your Flight ✈️</h2>
      <form method="post" action="${pageContext.request.contextPath}/BookFlight">
        <label for="from">From</label>
        <input type="text" id="from" name="from" placeholder="e.g., Kathmandu">

        <label for="to">To</label>
        <input type="text" id="to" name="to" placeholder="e.g., Tokyo">

        <label for="date">Departure Date</label>
        <input type="date" id="date" name="date">

        <label for="class">Class</label>
        <select id="class" name="class">
          <option>Economy</option>
          <option>Business</option>
          <option>First Class</option>
        </select>

        <label for="passengers">Passengers</label>
        <input type="number" id="passengers" name="passengers" min="1" value="1">

        <button type="submit">Book Now 💖</button>
      </form>
    </div>
  </div>

</body>
</html>
