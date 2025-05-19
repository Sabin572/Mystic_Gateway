<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Manage Packages - Mystic Gateway</title>
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
            width: 200px;
            padding: 30px 20px;
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

        th,
        td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #8000ff;
            color: white;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="file"] {
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

        .message {
            margin-bottom: 20px;
            font-weight: bold;
            color: green;
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
            <h2 class="welcome">All Packages</h2>

            <a href="<%= request.getContextPath() %>/AddPackage"
               style="display:inline-block; margin-bottom: 20px; padding: 8px 15px; background-color: #8000ff; color: white; text-decoration: none; border-radius: 5px;">
               Add Package
            </a>

            <% 
                String msg = (String) session.getAttribute("message");
                if (msg != null) {
            %>
                <div class="message"><%= msg %></div>
            <%
                    session.removeAttribute("message");
                }
            %>

            <table>
                <thead>
                    <tr>
                        <th>Destination ID</th>
                        <th>Image</th>
                        <th>Destination</th>
                        <th>Duration (Days)</th>
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
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel-mystic-gateway", "root", "");
                            stmt = conn.createStatement();
                            String sql = "SELECT * FROM packages";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String currentId = String.valueOf(rs.getInt("id"));
                                String resource = rs.getString("Resources");
                                String destination = rs.getString("destination");
                                String duration = rs.getString("duration");

                                if (currentId.equals(editModeId)) {
                    %>
                        <form method="post" action="Packages" enctype="multipart/form-data">
                            <tr>
                                <td><%= currentId %></td>
                                <td>
                                    <img src="<%= request.getContextPath() %>/Resources/<%= resource %>" width="100" alt="Current Image" /><br />
                                    <input type="file" name="Resources" accept="image/*" />
                                    <input type="hidden" name="oldResources" value="<%= resource %>" />
                                </td>
                                <td><input type="text" name="destination" value="<%= destination %>" required /></td>
                                <td><input type="text" name="duration" value="<%= duration %>" required /></td>
                                <td>
                                    <input type="hidden" name="action" value="update" />
                                    <input type="hidden" name="id" value="<%= currentId %>" />
                                    <button type="submit">Save</button>
                                </td>
                            </tr>
                        </form>
                    <%
                                } else {
                    %>
                        <tr>
                            <td><%= currentId %></td>
                            <td><img src="<%= request.getContextPath() %>/Resources/<%= resource %>" width="100" alt="Package Image" /></td>
                            <td><%= destination %></td>
                            <td><%= duration %></td>
                            <td>
                                <form method="get" action="Packages" style="display:inline;">
                                    <input type="hidden" name="edit_id" value="<%= currentId %>" />
                                    <button type="submit" style="background-color: green;">Edit</button>
                                </form>
                                <form method="get" action="Packages" style="display:inline;" 
                                      onsubmit="return confirm('Are you sure you want to delete this package?');">
                                    <input type="hidden" name="action" value="delete" />
                                    <input type="hidden" name="id" value="<%= currentId %>" />
                                    <button type="submit" style="background-color: red;">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <%
                                }
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
