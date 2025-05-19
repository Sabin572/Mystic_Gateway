<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Mystic_Gateway.Model.PackageModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Search Results</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/SearchResult.css" />
    <style>
    
    body {
    background-color: #6200ea;
     }

        /* Container */
        .search-results {
            max-width: 700px;
            margin: 30px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Heading */
        .search-results h2 {
            color: #333;
            margin-bottom: 15px;
            font-weight: 600;
            font-size: 24px;
            text-align: center;
        }

        /* List reset */
        .search-results ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        /* Each result */
        .search-results li {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 15px;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            gap: 20px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            cursor: pointer;
        }

        .search-results li:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        /* Image */
        .search-results li img {
            width: 400;
            height: 300px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        /* Text container */
        .result-info {
            flex-grow: 1;
            display: inline
        }

        /* Destination title */
        .result-info h1 {
            margin: 0 0 8px 0;
            color: #007BFF;
            font-size: 20px;
        }

        /* Duration text */
        .result-info h2 {
            margin: 0;
            color: #555;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="search-results">
    <h2>Search Results for "${query}"</h2>

    <c:choose>
        <c:when test="${empty searchResults}">
            <p>No results found.</p>
        </c:when>
        <c:otherwise>
            <ul>
                <c:forEach var="pkg" items="${searchResults}">
                    <li>
                        <img src="${pageContext.request.contextPath}/Resources/${pkg.resources}" alt="${pkg.destination}" />
                        <div class="result-info">
                            <h1>${pkg.destination}</h1>
                            <h2>Duration: ${pkg.duration} days</h2>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
