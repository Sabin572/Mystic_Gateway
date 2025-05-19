<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mystic Gateway</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/Home.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
  
  <div class="hero-image">
    <img src="${pageContext.request.contextPath}/Resources/himalaya.jpg" alt="Travel Agency Hero Image">
  </div>
  
  <div class="container">
    <div class="text-section">
      <h1>Find The Perfect Place</h1>
      <p>A list of the top 75 Best Tourist Places to See in the world for a perfect holiday or a trip.</p>
      <a href="#" class="view-more">View More</a>
    </div>
    <div class="cards-section">
      <div class="card">
        <a href="TravelBooking?place=Everest Base Camp&image=3.jpg">
          <img src="${pageContext.request.contextPath}/Resources/3.jpg" alt="Everest Base Camp">
        </a>
        <div class="title">Everest Base Camp</div>
        <div class="rating">⭐ 4.5</div>
      </div>
      <div class="card">
        <a href="TravelBooking?place=Annapurna Circuit&image=1.jpg">
          <img src="${pageContext.request.contextPath}/Resources/1.jpg" alt="Annapurna Circuit">
        </a>
        <div class="title">Annapurna Circuit</div>
        <div class="rating">⭐ 4.5</div>
      </div>
      <div class="card">
        <a href="TravelBooking?place=Chitwan Jungle&image=2.jpg">
          <img src="${pageContext.request.contextPath}/Resources/2.jpg" alt="Chitwan Jungle">
        </a>
        <div class="title">Chitwan Jungle</div>
        <div class="rating">⭐ 4.5</div>
      </div>
      <div class="card">
        <a href="TravelBooking?place=Lumbini Peace Park&image=4.jpg">
          <img src="${pageContext.request.contextPath}/Resources/4.jpg" alt="Lumbini Peace Park">
        </a>
        <div class="title">Lumbini Peace Park</div>
        <div class="rating">⭐ 4.5</div>
      </div>
    </div>
  </div>
  
  <div class="explore">
    <h1>Explore Nepal</h1>
  </div>
  <div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Pokhara Phewa Lake&image=pokhralake.png">
        <img src="${pageContext.request.contextPath}/Resources/pokhralake.png" alt="Pokhara Phewa Lake">
      </a>
      <p><b>Pokhara Phewa Lake</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Basantapur Durbar Square&image=basantapur.webp">
        <img src="${pageContext.request.contextPath}/Resources/basantapur.webp" alt="Basantapur Durbar Square">
      </a>
      <p><b>Basantapur Durbar Square</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Boudhanath Stupa&image=boudhanatha.jpg">
        <img src="${pageContext.request.contextPath}/Resources/boudhanatha.jpg" alt="Boudhanath Stupa">
      </a>
      <p><b>Boudhanath Stupa</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Ghandruk&image=gundruk.webp">
        <img src="${pageContext.request.contextPath}/Resources/gundruk.webp" alt="Ghandruk">
      </a>
      <p><b>Ghandruk</b></p>
    </div>
  </div>

  <div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Mt. Langtang&image=langatang.jpg">
        <img src="${pageContext.request.contextPath}/Resources/langatang.jpg" alt="Mt. Langtang">
      </a>
      <p><b>Mt. Langtang</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Janaki Temple, Janakpur&image=janaki_temple_d9cDtcYr7T.jpg">
        <img src="${pageContext.request.contextPath}/Resources/janaki_temple_d9cDtcYr7T.jpg" alt="Janaki Temple, Janakpur">
      </a>
      <p><b>Janaki Temple, Janakpur</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Lumbini&image=lumbuni.jpg">
        <img src="${pageContext.request.contextPath}/Resources/lumbuni.jpg" alt="Lumbini">
      </a>
      <p><b>Lumbini</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=The Shey Phoksundo Lake&image=the-shey-phoksundo-lake.jpg">
        <img src="${pageContext.request.contextPath}/Resources/the-shey-phoksundo-lake.jpg" alt="The Shey Phoksundo Lake">
      </a>
      <p><b>The Shey Phoksundo Lake</b></p>
    </div>
  </div>

  <div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Tilicho Lake&image=Tilicho-Lake-Trek.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Tilicho-Lake-Trek.jpg" alt="Tilicho Lake">
      </a>
      <p><b>Tilicho Lake</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Swayambhunath Stupa&image=sombu.webp">
        <img src="${pageContext.request.contextPath}/Resources/sombu.webp" alt="Swayambhunath Stupa">
      </a>
      <p><b>Swayambhunath Stupa</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Pashupatinath Temple&image=pashupati.jpg">
        <img src="${pageContext.request.contextPath}/Resources/pashupati.jpg" alt="Pashupatinath Temple">
      </a>
      <p><b>Pashupatinath Temple</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Chitwan National Park&image=One-horn-rhino.jpg">
        <img src="${pageContext.request.contextPath}/Resources/One-horn-rhino.jpg" alt="Chitwan National Park">
      </a>
      <p><b>Chitwan National Park</b></p>
    </div>
  </div>

  <section class="partners-section text-center">
    <h2 class="fw-bold">Our Partners</h2>
    <div class="d-flex justify-content-center align-items-center gap-5 flex-wrap mt-4">
      <i class="fas fa-plane fa-3x partner-icon"></i>
      <i class="fas fa-star fa-3x partner-icon"></i>
      <div class="highlighted-logo">
        <i class="fas fa-globe fa-3x"></i>
      </div>
      <i class="fas fa-paper-plane fa-3x partner-icon"></i>
      <i class="fas fa-plane-departure fa-3x partner-icon"></i>
    </div>
  </section>
  <div class="Customer">
    <h1>Happy Customers</h1>
    <p>Here from our customers. Each customer holds different experiences and adventures. Our customer makes us no.1 travel company in Nepal.</p>
    <div class="cus-images">
      <div class="image-box">
        <img src="${pageContext.request.contextPath}/Resources/customer1.jpg" alt="Loose Curls">
      </div>
      <div class="image-box">
        <img src="${pageContext.request.contextPath}/Resources/customer2.jpg" alt="Spiral">
      </div>
      <div class="image-box">
        <img src="${pageContext.request.contextPath}/Resources/customer3.jpg" alt="Tight">
      </div>
      <div class="image-box">
        <img src="${pageContext.request.contextPath}/Resources/cutomer4.jpg" alt="Coily">
      </div>
    </div>
  </div>
</body>
</html>