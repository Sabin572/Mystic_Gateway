<%@ page import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>All Bookings</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/Booking.css">  
</head>
<body>
  <div class="header">Mystic Gateway</div>

  <div class="dashboard-container">
    <aside class="sidebar">
      <h2>Travel</h2>
     <ul>
        <li><a href="${pageContext.request.contextPath}/Dashboard">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/Booking">Bookings</a></li>
        <li><a href="${pageContext.request.contextPath}/ManageUser">Manage Users</a></li>
        <li><a href="${pageContext.request.contextPath}/Packages">Manage Packages</a></li>
        <li><a href="${pageContext.request.contextPath}/AdminProfile">My Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/Login">Log out</a></li>
      </ul>
    </aside>

    <main class="main-content">
      <h2 class="welcome">All Bookings</h2>

      <table>
        <tr>
          <th>Booking ID</th>
          <th>Customer ID</th>
          <th>Booking Type</th>
          <th>Reference ID</th>
          <th>Booking Date</th>
          <th>Status</th>
          <th>Action</th>
        </tr>

        <%
          Connection conn = null;
          Statement stmt = null;
          ResultSet rs = null;

          try {
              Class.forName("com.mysql.cj.jdbc.Driver");
              conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel-mystic-gateway", "root", "");
              stmt = conn.createStatement();
              rs = stmt.executeQuery("SELECT * FROM booking");

              while(rs.next()) {
        %>
        <tr>
          <td><%= rs.getInt("booking_id") %></td>
          <td><%= rs.getInt("customer_id") %></td>
          <td><%= rs.getString("booking_type") %></td>
          <td><%= rs.getString("reference_id") %></td>
          <td>
            <%
              java.sql.Timestamp timestamp = rs.getTimestamp("booking_time");
              String formattedDate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
              out.print(formattedDate);
            %>
          </td>
          <td><%= rs.getString("status") %></td>
          <td>
            <button class="btn-approve" onclick="updateStatus(<%=rs.getInt("booking_id")%>, 'Confirmed', this)">Approve</button>
            <button class="btn-cancel" onclick="updateStatus(<%=rs.getInt("booking_id")%>, 'Cancelled', this)">Cancel</button>
          </td>
        </tr>

        <%
              }
          } catch(Exception e) {
              out.println("Error: " + e.getMessage());
          } finally {
              if (rs != null) rs.close();
              if (stmt != null) stmt.close();
              if (conn != null) conn.close();
          }
        %>

      </table>
    </main>
  </div>
    <script src="<%= request.getContextPath() %>/JavaScript/Booking.js"></script>
    <script>
    function updateStatus(bookingId, newStatus, button) {
        fetch('<%= request.getContextPath() %>/Booking', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: 'booking_id=' + encodeURIComponent(bookingId) + '&status=' + encodeURIComponent(newStatus),
        })
        .then(response => response.text())
        .then(data => {
          if (data.trim() === 'success') {
            // Update the status cell in the row
            const row = button.closest('tr');
            const statusCell = row.querySelector('td:nth-child(6)');
            statusCell.textContent = newStatus;
          } else {
          }
        })
        .catch(() => {
          alert('Error updating status');
        });
      }
    </script>
    
</body>
</html>