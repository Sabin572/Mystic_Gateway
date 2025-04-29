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
  <body>
  <div class="headingcontainer">
      <h1>Welcome to the Blog Page of Mystic Gateway</h1>
    </div>
  <section class="hero">
    <div class="container">
      <h2>Reach The World With Us</h2>
      <p>Make the booking with us and enjoy your world trip.</p>
    </div>
  </section>

  <main class="blog-posts container">
    <article class="post">
      <img src="${pageContext.request.contextPath}/Resources/BlogImage3.jpg" alt="Post Image" />
      <h3>Why You Must Hire a Trekking Agency</h3>
      <p>Nepal, home to 8 of the tallest peaks in the world, has paved its way into the wish list of many trekker</p>
      <a href="https://hsj.com.np/blog/why-you-must-hire-a-trekking-agency-in-nepal">Read More</a>
    </article>

    <article class="post">
      <img src="${pageContext.request.contextPath}/Resources/BlogImage4.jpg" alt="Post Image" />
      <h3>8 out of 14 Tallest Peaks of the Wo...</h3>
      <p>Nepal is blessed with varied geological structure making it a wayfarer's heaven. The Himalayan nation shockingly</p>
      <a href="https://hsj.com.np/blog/8-out-of-14-tallest-peaks-of-the-world-in-nepal">Read More</a>
    </article>
    
    <article class="post">
      <img src="${pageContext.request.contextPath}/Resources/BlogImage6.png" alt="Post Image" />
      <h3>Top 5 Facts about the Queen of Lake...</h3>
      <p>The "Queen of Lakes," the Rara, located in the western part of Nepal</p>
      <a href="https://hsj.com.np/blog/top-5-facts-about-the-queen-of-lakes-the-rara-lake">Read More</a>
    </article>
  </main>
  <main class="blog-posts container">
    <article class="post">
      <img src="${pageContext.request.contextPath}/Resources/BlogImage7.jpg" alt="Post Image" />
      <h3>Best Treks of Nepali Mountains</h3>
      <p>Annapurna Base Camp Trek For anyone that has been accustomed to t</p>
      <a href="https://hsj.com.np/blog/best-treks-of-himalayas">Read More</a>
    </article>

    <article class="post">
      <img src="${pageContext.request.contextPath}/Resources/BlogImage8.jpg" alt="Post Image" />
      <h3>Reasons to do Mountain Flight in Ne...</h3>
      <p>"A very enjoyable flight and an everlasting memory""Enjoyable &amp; </p>
      <a href="https://hsj.com.np/blog/reasons-to-do-mountain-flight-in-nepal">Read More</a>
    </article>
    
    <article class="post">
      <img src="${pageContext.request.contextPath}/Resources/BlogImage9.jpg" alt="Post Image" />
      <h3>9 Reasons to Trek</h3>
      <p>If you have been wondering why half of the world is obsessed with trekking </p>
      <a href="https://hsj.com.np/blog/9-reasons-to-trek">Read More</a>
    </article>
  </main>
  <footer>
    <div class="container">
      <p>&copy; 2025 Travel Agent Blog. All rights reserved.</p>
    </div>
  </footer>
</body>
</html>
