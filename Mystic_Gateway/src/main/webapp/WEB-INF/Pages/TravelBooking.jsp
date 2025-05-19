<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book Your Trip</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h1>Book Your Trip to ${place}</h1>
    <div class="row">
      <div class="col-md-6">
        <img src="${pageContext.request.contextPath}/Resources/${image}"
             alt="${place}" class="img-fluid">
      </div>
      <div class="col-md-6">
        <form method="post" action="${pageContext.request.contextPath}/TravelBooking">
          <!-- bind the same place back to the POST -->
          <input type="hidden" name="destination" value="${place}"/>

          <div class="mb-3">
            <label for="duration" class="form-label">Duration (days):</label>
            <input type="number" class="form-control" id="duration"
                   name="duration" min="1" required>
          </div>
          <div class="mb-3">
            <label for="mode" class="form-label">Preferred Mode of Travel:</label>
            <select class="form-select" id="mode" name="mode" required>
              <option value="car">Car</option>
              <option value="bike">Bike</option>
              <option value="flight">Flight</option>
            </select>
          </div>
          <button type="submit" class="btn btn-primary">Book Now</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
