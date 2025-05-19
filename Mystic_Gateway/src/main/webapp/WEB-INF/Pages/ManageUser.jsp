<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users - Travel Agency</title>
    <link rel="stylesheet" href="styles.css">
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #8000ff;
            color: white;
        }

        input[type="text"], input[type="email"], input[type="date"] {
            width: 100%;
            padding: 6px;
        }

        button {
            padding: 6px 12px;
            background-color: #8000ff;
            color: white;
            border: none;
            cursor: pointer;
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
        <h2 class="welcome">Manage Users</h2>

        <table>
            <thead>
            <tr>
                <th>Customer ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Birthday</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                String editModeId = request.getParameter("edit_id");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel-mystic-gateway", "root", "");
                    stmt = conn.createStatement();
                    String sql = "SELECT customer_id, first_name, last_name, username, email, phone, birthday FROM customer";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String currentId = String.valueOf(rs.getInt("customer_id"));
                        if (currentId.equals(editModeId)) {
            %>
            <tr>
    <td><%= currentId %></td>
    <form method="post" action="ManageUser">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="customer_id" value="<%= currentId %>">
        <td><input type="text" name="first_name" value="<%= rs.getString("first_name") %>" /></td>
        <td><input type="text" name="last_name" value="<%= rs.getString("last_name") %>" /></td>
        <td><input type="text" name="username" value="<%= rs.getString("username") %>" /></td>
        <td><input type="email" name="email" value="<%= rs.getString("email") %>" /></td>
        <td><input type="text" name="phone" value="<%= rs.getString("phone") %>" /></td>
        <td><input type="date" name="birthday" value="<%= rs.getString("birthday") %>" /></td>
        <td><button type="submit">Save</button></td>
    </form>
</tr>


            <%  } else { %>
            <tr>
                <td><%= currentId %></td>
                <td><%= rs.getString("first_name") %></td>
                <td><%= rs.getString("last_name") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("birthday") %></td>
                <td>
                    <form method="get" action="ManageUser" style="display:inline;">
                        <input type="hidden" name="edit_id" value="<%= currentId %>" />
                        <button type="submit" style="background-color: green;">Edit</button>
                    </form>
                    <form method="get" action="ManageUser" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this user?');">
                        <input type="hidden" name="action" value="delete" />
                        <input type="hidden" name="customer_id" value="<%= currentId %>" />
                        <button type="submit" style="background-color: red;">Delete</button>
                    </form>
                    
                </td>
            </tr>
            <%      }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
            </tbody>
        </table>
    </main>
</div>
</body>
</html>