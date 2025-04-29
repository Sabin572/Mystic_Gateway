<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mystic Gateway</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Contact.css">
  </head>
  <body>
  <header>
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
    </header>
    <h1>Contact Us</h1>

  <div class="contact-container">
        <div class="contact-form">
            <h2>Contact Us</h2>
            <form id="contactForm" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your name">
                </div>
                <div class="form-group">
                    <label for="email">Gmail</label>
                    <input type="email" id="email" name="email" placeholder="Enter your Gmail">
                </div>
                <div class="form-group">
                    <label for="contact">Contact</label>
                    <input type="text" id="contact" name="contact" placeholder="Enter your contact number">
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" placeholder="Write your message" rows="5"></textarea>
                </div>
                <button class="submit">Submit</button>
                
            </form>
        </div>
        <div class="contact-image">
            <img src="${pageContext.request.contextPath}/Resources/ContactUs.jpg" alt="Contact Us">
        </div>
    </div>
	<script>
        function validateForm() {
            const name = document.getElementById('name').value.trim();
            const contact = document.getElementById('contact').value.trim();
            const email = document.getElementById('email').value.trim();
            const message = document.getElementById('message').value.trim();
            const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            const contactPattern = /^[0-9]{10}$/;
    
            if (!name) {
                alert("Name is required");
                return false;
            }
            if (!contactPattern.test(contact)) {
                alert("Please enter a valid 10-digit contact number");
                return false;
            }
            if (!emailPattern.test(email)) {
                alert("Please enter a valid Gmail address");
                return false;
            }
            if (!message) {
                alert("Message cannot be empty");
                return false;
            }
            else {
            	alert("Thank You for Contacting. We will get back to you shortly.");
            	return true;
            }
        }
        </script>
</body>
</html>