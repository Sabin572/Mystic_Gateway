<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users - Travel Agency</title>
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
        }

        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            background-color: #444;
            color: white;
            width: 200px;
            padding: 30px 20px;
        }

        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar li {
            margin-bottom: 20px;
            font-size: 16px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-weight:bolder;
        }

        .sidebar a:hover {
            text-decoration: underline;
        }

        .main-content {
            flex: 1;
            padding: 40px;
            background-color: #f9f9f9;
        }

        .welcome {
            font-size: 24px;
            margin-bottom: 30px;
            color: #333;
        }

        form {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        form h2 {
            text-align: center;
            color: #8000ff;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: 600;
            color: #555;
        }

        input[type="text"], input[type="number"], input[type="file"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border 0.3s ease;
        }

        input:focus {
            border-color: #8000ff;
            outline: none;
        }

        button {
            width: 100%;
            background-color: #8000ff;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #5f00cc;
        }
    </style>
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
            <h2 class="welcome">Add Packages</h2>
            <form method="post" action="AddPackage" enctype="multipart/form-data">
                <h2>Add New Package</h2>

                <label for="destination">Destination:</label>
                <input type="text" name="destination" id="destination" required />

                <label for="duration">Duration (days):</label>
                <input type="number" name="duration" id="duration" min="1" required />

                <label for="image">Image:</label>
                <input type="file" name="image" id="image" accept="image/*" required />

                <button type="submit">Add Package</button>
            </form>
        </main>
    </div>
</body>
</html>
