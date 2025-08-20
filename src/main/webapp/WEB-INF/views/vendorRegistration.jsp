<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Vendor Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f0f0f0, #d0d0d0);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
            width: 450px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007BFF;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #1c7430;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Vendor Registration</h2>
        <form action="${pageContext.request.contextPath}/vendorDashboard" method="post">

            <label for="vendorName">Vendor Name</label>
            <input type="text" id="vendorName" name="vendorName" required>

            <label for="businessName">Business/Shop Name</label>
            <input type="text" id="businessName" name="businessName" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="mobile">Mobile Number</label>
            <input type="text" id="mobile" name="mobile" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <label for="category">Business Category</label>
            <select id="category" name="category" required>
                <option value="">-- Select Category --</option>
                <option value="electronics">Electronics</option>
                <option value="fashion">Fashion</option>
                <option value="grocery">Grocery</option>
                <option value="furniture">Furniture</option>
                <option value="others">Others</option>
            </select>

            <label for="address">Business Address</label>
            <textarea id="address" name="address" rows="3" required></textarea>

            <label for="gst">GST / Tax ID</label>
            <input type="text" id="gst" name="gst">

            <button type="submit" class="btn">Register as Vendor</button>
        </form>
        <a href="${pageContext.request.contextPath}/" class="back-link">← Back to Home</a>
    </div>
</body>
</html>
