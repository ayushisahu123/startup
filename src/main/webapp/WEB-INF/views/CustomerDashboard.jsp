<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mobile Accessories Store</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .category-card {
            transition: transform 0.3s;
        }
        .category-card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Mobile Accessories</a>
    <div class="ml-auto">
        <a href="login.jsp" class="btn btn-outline-light btn-sm">Login</a>
        <a href="signup.jsp" class="btn btn-warning btn-sm">Sign Up</a>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="text-center mb-4">Shop by Categories</h2>
    <div class="row">
        <!-- Earphones -->
        <div class="col-md-4 mb-4">
            <div class="card category-card shadow-sm">
                <img src="https://via.placeholder.com/300x200?text=Earphones" class="card-img-top" alt="Earphones">
                <div class="card-body text-center">
                    <h5 class="card-title">Earphones</h5>
                    <a href="products.jsp?category=earphones" class="btn btn-primary">View Products</a>
                </div>
            </div>
        </div>

        <!-- Chargers -->
        <div class="col-md-4 mb-4">
            <div class="card category-card shadow-sm">
                <img src="https://via.placeholder.com/300x200?text=Chargers" class="card-img-top" alt="Chargers">
                <div class="card-body text-center">
                    <h5 class="card-title">Chargers</h5>
                    <a href="products.jsp?category=chargers" class="btn btn-primary">View Products</a>
                </div>
            </div>
        </div>

        <!-- Covers -->
        <div class="col-md-4 mb-4">
            <div class="card category-card shadow-sm">
                <img src="https://via.placeholder.com/300x200?text=Covers" class="card-img-top" alt="Covers">
                <div class="card-body text-center">
                    <h5 class="card-title">Covers</h5>
                    <a href="products.jsp?category=covers" class="btn btn-primary">View Products</a>
                </div>
            </div>
        </div>

    </div>
</div>

<footer class="bg-dark text-white text-center py-3 mt-5">
    © 2025 Mobile Accessories Store | All Rights Reserved
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
