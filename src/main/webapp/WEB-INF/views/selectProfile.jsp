<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f5f5f5;
            margin-top: 100px;
        }
        h1 {
            color: #333;
        }
        .button-container {
            margin-top: 30px;
        }
        .signup-btn {
            display: inline-block;
            padding: 15px 30px;
            font-size: 18px;
            margin: 10px;
            cursor: pointer;
            border: none;
            border-radius: 8px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .signup-btn.vendor {
            background-color: #2196F3;
        }
        .signup-btn:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>

    <h1>Do you want to sign up as a Customer or Vendor?</h1>
    <div class="button-container">
         <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Sign Up as Customer</a>
         <a href="${pageContext.request.contextPath}/registerVendor" class="btn">Register as Vendor</a>
    </div>

</body>
</html>
