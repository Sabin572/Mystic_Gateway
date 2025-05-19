<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - Mystic Gateway</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/aboutstyle.css">
</head>
<body>

  <!-- Navbar -->
  <div class="navbar">
    <div class="logo">
      <h2><b><i>Mystic Gateway</i></b></h2>
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
  </div>

  <!-- Intro Section -->
  <section>
    <div class="image-placeholders">
      <img src="${pageContext.request.contextPath}/Resources/OurTeam.jpg" alt="Team Image" width="100%" height ="60%">
    </div>
    <p>
      Welcome to Mystic Gateway Travel Agency, your doorway to unforgettable adventures! Since 2000, we’ve been proudly based in Kathmandu, Nepal, helping travelers like you explore the beauty of the world with ease and excitement.
      <br><br>
      From tropical beach getaways to cultural deep-dives and adventure-packed tours, we design every journey with care and passion. Let Mystic Gateway be the bridge between your dreams and reality—your next adventure awaits!
      <br><br>
      Founded in 2018 and based in Kathmandu, Nepal, Mystic Gateway Travel Agency is your trusted partner for crafting unforgettable journeys to the world’s most enchanting destinations.
    </p>
  </section>

  <!-- Our Journey -->
  <section>
    <h2 class="section-title">Our Journey</h2>
    <div class="milestones">
      <div class="card">
        <img src="${pageContext.request.contextPath}/Resources/RibbonCutting.jpg" alt="Founded 2000">
        <h3>In 2000</h3>
        <p>Company founded with a focus on within-country travel.</p>
      </div>
      <div class="card">
        <img src="${pageContext.request.contextPath}/Resources/Expnaded.jpg" alt="Expanded 2005">
        <h3>2005</h3>
        <p>Expanded operations into India.</p>
      </div>
      <div class="card">
        <img src="${pageContext.request.contextPath}/Resources/ExpandedWorld.jpg" alt="Global 2015">
        <h3>2015</h3>
        <p>Now serving tourists from all over the world.</p>
      </div>
    </div>
  </section>

  <!-- Our Team -->
  <section>
    <h2 class="section-title">Our Team</h2>
    <div class="leaders">
      <div class="card">
        <div class="image-placeholder">
          <img src="${pageContext.request.contextPath}/Resources/Team01.jpg" alt="Deep Kalra">
        </div>
        <h3>Deep Kalra</h3>
        <p>Founder and Chairman</p>
      </div>
      <div class="card">
        <div class="image-placeholder">
          <img src="${pageContext.request.contextPath}/Resources/Team02.jpg" alt="Rajesh Magow">
        </div>
        <h3>Rajesh Magow</h3>
        <p>Group CEO</p>
      </div>
      <div class="card">
        <div class="image-placeholder">
          <img src="${pageContext.request.contextPath}/Resources/Team03.jpg" alt="Anjali Sharma">
        </div>
        <h3>Anjali Sharma</h3>
        <p>Head of Marketing</p>
      </div>
    </div>
  </section>

  <!-- Our Culture -->
  <section>
    <h2 class="section-title">Our Culture</h2>
    <div class="image-placeholder">Teamwork and Innovation Image</div>
    <p>
      We foster a culture of innovation, inclusivity, and continuous learning. Our teams work together to deliver memorable travel experiences with cutting-edge technology and unmatched service.
    </p>
  </section>

</body>
</html>
