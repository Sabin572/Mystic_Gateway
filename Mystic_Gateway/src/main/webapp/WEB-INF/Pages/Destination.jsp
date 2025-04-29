<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mystic Gateway</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/Destination.css">
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
 <div class="explore">
    <h1> Top Destinations</h1>
  </div>
  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/pokhra-1-1600x900.webp">
      <p> <b>Pokhara Phewa Lake</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/basantapur.webp">
      <p> <b>Basantapur Durbar Square</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/boudhanatha.jpg">
      <p> <b> &nbsp;Boudhanath Stupa</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/gundruk.webp">
      <p> <b>Ghandruk </b></p>
    </div>
  </div>

  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/langatang.jpg">
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Mt. Langtang</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/janaki_temple_d9cDtcYr7T.jpg">
      <p> <b>Janaki Temple, Janakpur</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/lumbuni.jpg">
      <p> <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lumbini</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/the-shey-phoksundo-lake.jpg">
      <p> <b>The Shey Phoksundo Lake</b></p>
    </div>
  </div>
  
  <div class="explore">
    <h1> Thailand Tour</h1>
  </div>
  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thai01.jpg">
      <p> <b>Pokhara Phewa Lake</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thai02.jpg">
      <p> <b>Basantapur Durbar Square</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thai03.jpg">
      <p> <b> &nbsp;Boudhanath Stupa</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thai04.jpg">
      <p> <b>Ghandruk </b></p>
    </div>
  </div>

  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thai05.jpg">
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Mt. Langtang</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thai06.jpg">
      <p> <b>Janaki Temple, Janakpur</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thailand7.jpg">
      <p> <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lumbini</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Thai08.jpg">
      <p> <b>The Shey Phoksundo Lake</b></p>
    </div>
  </div>
  <div class="explore">
    <h1> India Tour</h1>
  </div>
  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind01.jpg">
      <p> <b>Pokhara Phewa Lake</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind02.jpg">
      <p> <b>Basantapur Durbar Square</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind03.jpg">
      <p> <b> &nbsp;Boudhanath Stupa</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind04.jpg">
      <p> <b>Ghandruk </b></p>
    </div>
  </div>

  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind08.jpg">
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Mt. Langtang</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind04.jpg">
      <p> <b>Janaki Temple, Janakpur</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind05.jpg">
      <p> <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lumbini</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Ind06.avif">
      <p> <b>The Shey Phoksundo Lake</b></p>
    </div>
  </div>
  
  <div class="explore">
    <h1> Bhutan Tour</h1>
  </div>
  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Bhu01.webp">
      <p> <b>Pokhara Phewa Lake</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Bhu02.jpg">
      <p> <b>Basantapur Durbar Square</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/bhu03.jpg">
      <p> <b> &nbsp;Boudhanath Stupa</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/bhu04.jpg">
      <p> <b>Ghandruk </b></p>
    </div>
  </div>

  <div class="cardfile">
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Bhu05.webp">
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Mt. Langtang</b></p>
    </div>
    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Bhu06.jpg">
      <p> <b>Janaki Temple, Janakpur</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Bhu07.webp">
      <p> <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lumbini</b></p>
    </div>

    <div class="a1">
      <img src="${pageContext.request.contextPath}/Resources/Bhu08.jpg">
      <p> <b>The Shey Phoksundo Lake</b></p>
    </div>
  </div>
</body>
</html>