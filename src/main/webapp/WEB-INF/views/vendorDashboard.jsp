<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background: #343a40;
            color: #fff;
        }
        .sidebar a {
            color: #ddd;
            text-decoration: none;
            display: block;
            padding: 12px;
        }
        .sidebar a:hover {
            background: #495057;
            color: #fff;
        }
        .content {
            padding: 20px;
        }
        .card {
            transition: transform 0.2s ease-in-out;
        }
        .card:hover {
            transform: scale(1.03);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block sidebar">
            <div class="p-3">
                <h4 class="text-white">Vendor Panel</h4>
                <a href="#addProducts">➕ Add Product</a>
                <a href="#viewProducts">📦 My Products</a>
                <a href="#orders">🛒 Orders</a>
                <a href="#profile">👤 Profile</a>
                <a href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto col-lg-10 px-md-4 content">
            <h2 class="mb-4">Welcome, <c:out value="${user.username}" /></h2>

            <div class="row g-4">
                <!-- Add Products -->
                <div class="col-md-4" id="addProducts">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">Add Products</h5>
                            <p class="card-text">Upload new products to your store.</p>
                            <a href="${pageContext.request.contextPath}/addProduct" class="btn btn-primary">Add</a>
                        </div>
                    </div>
                </div>

                <!-- My Products -->
                <div class="col-md-4" id="viewProducts">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">My Products</h5>
                            <p class="card-text">View, edit, or delete your existing products.</p>
                            <a href="${pageContext.request.contextPath}/viewProduct" class="btn btn-success">View</a>
                        </div>
                    </div>
                </div>

                <!-- Orders -->
                <div class="col-md-4" id="orders">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">Orders</h5>
                            <p class="card-text">Check customer orders and manage delivery.</p>
                            <a href="${pageContext.request.contextPath}/vendor/orders" class="btn btn-warning">Orders</a>
                        </div>
                    </div>
                </div>

                <!-- Profile -->
                <div class="col-md-4" id="profile">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">Profile</h5>
                            <p class="card-text">Update your information & password.</p>
                            <a href="${pageContext.request.contextPath}/vendor/profile" class="btn btn-info">Edit</a>
                        </div>
                    </div>
                </div>

                <!-- Analytics -->
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <h5 class="card-title">Analytics</h5>
                            <p class="card-text">Track sales, revenue & performance.</p>
                            <a href="${pageContext.request.contextPath}/vendor/analytics" class="btn btn-dark">View</a>
                        </div>
                    </div>
                </div>

                <!-- Logout -->
                <div class="col-md-4">
                    <div class="card shadow-sm bg-danger text-white">
                        <div class="card-body text-center">
                            <h5 class="card-title">Logout</h5>
                            <p class="card-text">Sign out from your dashboard securely.</p>
                            <a href="${pageContext.request.contextPath}/logout" class="btn btn-light">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
