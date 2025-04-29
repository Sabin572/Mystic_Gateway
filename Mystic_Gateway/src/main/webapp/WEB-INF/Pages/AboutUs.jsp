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
    <div class="navbar">
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
    </div>
    <section>
      <div class="image-placeholders">
        <img src="${pageContext.request.contextPath}/Resources/OurTeam.jpg" alt="Team Imagestyle="
          style="width:100%; height:60vh; object-fit:cover;">
      </div>
      <p>Welcome to Mystic Gateway Travel Agency, your doorway to unforgettable adventures! Since 2000, we’ve been proudly based in Kathmandu, Nepal, helping travelers like you explore the beauty of the world with ease and excitement. From tropical beach getaways to cultural deep-dives and adventure-packed tours, we design every journey with care and passion.
       Let Mystic Gateway be the bridge between your dreams and reality—your next adventure awaits! Founded in 2018 and based in Kathmandu, Nepal, Mystic Gateway Travel Agency is your trusted partner for crafting unforgettable journeys to the world’s most enchanting destinations. We specialize in creating personalized travel experiences that blend adventure, comfort, and culture, ensuring every trip is as unique as you are. Whether you dream of exploring ancient cities, relaxing on pristine beaches, or embarking on thrilling adventures, Mystic Gateway turns your travel dreams into reality. With expert planning, exclusive deals, and a passion for exploration,
       we open the gateway to a world of endless possibilities. Let us guide you on your next unforgettable adventure!</p>
    </section>

    <section>
      <h2 class="section-title">Our Journey</h2>
      <div class="milestones">
        <div class="card">
        <img src="${pageContext.request.contextPath}/Resources/RibbonCutting.jpg">
          <h3>In 2000</h3>
          <p>Company founded with a focus on with in country travel.</p>
        </div>
        <div class="card">
         <img src="${pageContext.request.contextPath}/Resources/Expnaded.jpg">
          <h3>2005</h3>
          <p>Expanded operations in India.</p>
        </div>
        <div class="card">
         <img src="${pageContext.request.contextPath}/Resources/ExpandedWorld.jpg">
          <h3>2015</h3>
          <p>Serving the tourist from all over the World.</p>
        </div>
      </div>
    </section>

    <section>
      <h2 class="section-title">Leadership Team</h2>
      <div class="leaders">
        <div class="card">
          <div class="image-placeholder">
			<img src ="${pageContext.request.contextPath}/Resources/Team01.jpg">
			</div>
          <h3>Deep Kalra</h3>
          <p>Founder and Chairman</p>
        </div>
        <div class="card">
          <div class="image-placeholder">Leader Photo</div>
          <h3>Rajesh Magow</h3>
          <p>Group CEO</p>
        </div>
        <!-- Add more leaders as needed -->
      </div>
    </section>

    <section>
      <h2 class="section-title">Our Culture</h2>
      <div class="image-placeholder">Teamwork and Innovation Image</div>
      <p>We foster a culture of innovation, inclusivity, and continuous learning. Our teams work together to deliver
        memorable travel experiences with cutting-edge technology and unmatched service.</p>
    </section>
  </body>

  </html>