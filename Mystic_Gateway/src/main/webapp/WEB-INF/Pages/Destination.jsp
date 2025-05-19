<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Mystic_Gateway.Model.PackageModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Destinations</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Destination.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<% List<PackageModel> packagesList = (List<PackageModel>) request.getAttribute("packagesList"); %>

</head>
<body>
<style>
/* Container for the search form */
.search-form {
  display: flex;
  max-width: 450px;
  margin: 40px auto;
  background: #fff;
  border-radius: 50px;
  box-shadow: 0 8px 20px rgba(0, 123, 255, 0.2);
  overflow: hidden;
  transition: box-shadow 0.3s ease;
}

/* Input field styling */
.search-form input[type="text"] {
  flex: 1;
  padding: 15px 25px;
  border: none;
  font-size: 18px;
  color: #333;
  font-weight: 500;
  outline: none;
  border-radius: 50px 0 0 50px;
  transition: background-color 0.3s ease;
}

.search-form input[type="text"]::placeholder {
  color: #aaa;
  font-style: italic;
}

/* Button styling */
.search-form button {
  background: #007bff;
  border: none;
  padding: 0 30px;
  cursor: pointer;
  color: white;
  font-size: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 0 50px 50px 0;
  transition: background-color 0.3s ease;
  box-shadow: inset 0 -4px 10px rgba(255, 255, 255, 0.3);
}

/* Button hover effect */
.search-form button:hover {
  background: #0056b3;
  box-shadow: inset 0 4px 10px rgba(255, 255, 255, 0.6);
}

/* Add a subtle focus effect on input */
.search-form input[type="text"]:focus {
  background-color: #f0f8ff;
}

/* Icon color */
.search-form button i.fa-search {
  pointer-events: none;
}</style>
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

<form class= "search-form" action="SearchProduct" method="Post">
        <input type="text" name="packageName" placeholder="Search destination" required>
        <button type="submit"><i class= "fa fa-search"></i></button>
    </form>
    
    <c:forEach var="pkg" items="${searchResults}">
    <div>
        <img src="path/to/images/${pkg.resources}" alt="${pkg.destination}">
        <h3>${pkg.destination}</h3>
        <p>${pkg.duration}</p>
    </div>
</c:forEach>
    

    <h2>Available Packages</h2>


<div class="explore">
    <h1>Top Destinations</h1>
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
<div class="explore">
    <h1>Thailand Tour</h1>
</div>
<div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Grand Palace, Bangkok&image=Thai01.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thai01.jpg" alt="Grand Palace, Bangkok">
      </a>
      <p><b>Grand Palace, Bangkok</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Ayutthaya Historical Park&image=Thai02.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thai02.jpg" alt="Ayutthaya Historical Park">
      </a>
      <p><b>Ayutthaya Historical Park</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Chiang Mai Temples&image=Thai03.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thai03.jpg" alt="Chiang Mai Temples">
      </a>
      <p><b>Chiang Mai Temples</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Phi Phi Islands&image=Thai04.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thai04.jpg" alt="Phi Phi Islands">
      </a>
      <p><b>Phi Phi Islands</b></p>
    </div>
</div>
<div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Chiang Rai White Temple&image=Thai05.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thai05.jpg" alt="Chiang Rai White Temple">
      </a>
      <p><b>Chiang Rai White Temple</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Sukhothai Historical Park&image=Thai06.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thai06.jpg" alt="Sukhothai Historical Park">
      </a>
      <p><b>Sukhothai Historical Park</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Phuket Old Town&image=Thailand7.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thailand7.jpg" alt="Phuket Old Town">
      </a>
      <p><b>Phuket Old Town</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Krabi Beaches&image=Thai08.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Thai08.jpg" alt="Krabi Beaches">
      </a>
      <p><b>Krabi Beaches</b></p>
    </div>
</div>
<div class="explore">
    <h1>India Tour</h1>
</div>
<div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Taj Mahal&image=Ind01.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Ind01.jpg" alt="Taj Mahal">
      </a>
      <p><b>Taj Mahal</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Golden Temple&image=Ind02.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Ind02.jpg" alt="Golden Temple">
      </a>
      <p><b>Golden Temple</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Qutub Minar&image=Ind03.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Ind03.jpg" alt="Qutub Minar">
      </a>
      <p><b>Qutub Minar</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Varanasi Ghats&image=Ind04.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Ind04.jpg" alt="Varanasi Ghats">
      </a>
      <p><b>Varanasi Ghats</b></p>
    </div>
</div>
<div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Jaipur Amber Fort&image=Ind08.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Ind08.jpg" alt="Jaipur Amber Fort">
      </a>
      <p><b>Jaipur Amber Fort</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Hampi Ruins&image=Ind04.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Ind04.jpg" alt="Hampi Ruins">
      </a>
      <p><b>Hampi Ruins</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Goa Beaches&image=Ind05.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Ind05.jpg" alt="Goa Beaches">
      </a>
      <p><b>Goa Beaches</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Kerala Backwaters&image=Ind06.avif">
        <img src="${pageContext.request.contextPath}/Resources/Ind06.avif" alt="Kerala Backwaters">
      </a>
      <p><b>Kerala Backwaters</b></p>
    </div>
</div>
<div class="explore">
    <h1>Bhutan Tour</h1>
</div>
<div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Paro Taktsang&image=Bhu01.webp">
        <img src="${pageContext.request.contextPath}/Resources/Bhu01.webp" alt="Paro Taktsang">
      </a>
      <p><b>Paro Taktsang</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Thimphu Dzong&image=Bhu02.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Bhu02.jpg" alt="Thimphu Dzong">
      </a>
      <p><b>Thimphu Dzong</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Punakha Dzong&image=bhu03.jpg">
        <img src="${pageContext.request.contextPath}/Resources/bhu03.jpg" alt="Punakha Dzong">
      </a>
      <p><b>Punakha Dzong</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Bumthang Valley&image=bhu04.jpg">
        <img src="${pageContext.request.contextPath}/Resources/bhu04.jpg" alt="Bumthang Valley">
      </a>
      <p><b>Bumthang Valley</b></p>
    </div>
</div>
<div class="cardfile">
    <div class="a1">
      <a href="TravelBooking?place=Dochula Pass&image=Bhu05.webp">
        <img src="${pageContext.request.contextPath}/Resources/Bhu05.webp" alt="Dochula Pass">
      </a>
      <p><b>Dochula Pass</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Haa Valley&image=Bhu06.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Bhu06.jpg" alt="Haa Valley">
      </a>
      <p><b>Haa Valley</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Phobjikha Valley&image=Bhu07.webp">
        <img src="${pageContext.request.contextPath}/Resources/Bhu07.webp" alt="Phobjikha Valley">
      </a>
      <p><b>Phobjikha Valley</b></p>
    </div>
    <div class="a1">
      <a href="TravelBooking?place=Chele La Pass&image=Bhu08.jpg">
        <img src="${pageContext.request.contextPath}/Resources/Bhu08.jpg" alt="Chele La Pass">
      </a>
      <p><b>Chele La Pass</b></p>
    </div>
</div>
</body>
</html>