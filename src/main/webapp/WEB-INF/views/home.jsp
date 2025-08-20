<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Welcome to Youwantt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: linear-gradient(135deg, #f0f0f0, #d0d0d0);
            padding-top: 100px;
        }
        h1 {
            color: #333;
            font-size: 40px;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 40px;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            font-size: 16px;
            margin: 10px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #28a745;
        }
        .btn-secondary:hover {
            background-color: #1c7430;
        }
    </style>
</head>
<body>
    <h1>Welcome to YouWanttt</h1>
    <p>Are you a new user?</p>

    <a href="${pageContext.request.contextPath}/login" class="btn">Login</a>
    <a href="${pageContext.request.contextPath}/selectProfile" class="btn btn-secondary">Sign Up</a>

    <c:if test="${not empty message}">
        <p style="color:green">${message}</p>
    </c:if>
</body>
</html>
