<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Mystic Gateway</title>
 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
  background-color: #f5f5f5;
}

.header {
  background-color: #8000ff;
  color: black;
  padding: 20px;
  font-size: 28px;
  font-weight: 700;
  font-style: italic;
  text-align: center;
}

.dashboard-container {
  display: flex;
  height: 100vh;
}

.sidebar {
            background-color: #444;
            color: white;
            width: 180px;
            padding: 20px;
        }

        .sidebar h2 {
            font-size: 26px;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar li {
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 16px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
        }

.main-content {
  flex: 1;
  padding: 30px;
}

.welcome {
  font-size: 20px;
  margin-bottom: 30px;
}

.stats {
  display: flex;
  gap: 30px;
  margin-bottom: 30px;
}

.card {
  background-color: #d3d3d3;
  padding: 20px;
  width: 200px;
  height: 100px;
  border-radius: 15px;
  text-align: center;
  justify-content: space-between;
  margin: 40px;
}

.card h3 {
  font-size: 18px;
  margin-bottom: 10px;
}

.card .value {
  font-size: 22px;
  font-weight: bold;
}

.charts {
  display: flex;
  gap: 40px;
  width:34rem;
}

canvas {
    width: 10px;
  background: white;
  padding: 20px;
  border-radius: 15px;
}

</style>
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
      <h2 class="welcome">Welcome back, Sabin!</h2>

      <div class="stats">
        <div class="card">
            <h3>Total User</h3>
            <p class="value">231</p>
          </div>
        <div class="card">
          <h3>Total Sales</h3>
          <p class="value">$216.8K</p>
        </div>
        <div class="card">
          <h3>Bookings</h3>
          <p class="value">28</p>
        </div>
        <div class="card">
          <h3>Destination</h3>
          <p class="value">26</p>
        </div>
      </div>

      <div class="charts">
        <canvas id="barChart"></canvas>
        <canvas id="lineChart"></canvas>
      </div>
    </main>
  </div>

  <script src="scripts.js"></script>
</body>
<script>
// Bar Chart
const barCtx = document.getElementById('barChart').getContext('2d');
new Chart(barCtx, {
  type: 'bar',
  data: {
    labels: ['January', 'February', 'March', 'April'],
    datasets: [{
      label: 'Sales',
      data: [8, 12, 15, 20],
      backgroundColor: ['#60d5ec', '#36c3dd', '#2ca0cc', '#1f6dbb']
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: { display: false }
    },
    scales: {
      y: { beginAtZero: true }
    }
  }
});

// Line Chart
const lineCtx = document.getElementById('lineChart').getContext('2d');
new Chart(lineCtx, {
  type: 'line',
  data: {
    labels: ['January', 'February', 'March', 'April'],
    datasets: [{
      label: 'Bookings',
      data: [18, 27, 24, 34, 4],
      borderColor: '#61ecf0',
      backgroundColor: 'transparent',
      tension: 0.4
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: { display: false }
    },
    scales: {
      y: { beginAtZero: true }
    }
  }
});
    
</script>
</html>
