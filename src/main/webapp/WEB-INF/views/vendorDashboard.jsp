<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vendor Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
            position: fixed;
            width: 220px;
        }
        .sidebar a {
            color: #fff;
            display: block;
            padding: 12px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 230px;
            padding: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-white text-center">Vendor Panel</h4>
        <a href="#">🏠 Dashboard</a>
        <a href="#">➕ Add Product</a>
        <a href="#">📦 Manage Products</a>
        <a href="#">🛒 Orders</a>
        <a href="#">💰 Earnings</a>
        <a href="#">👤 Profile</a>
        <a href="#">🚪 Logout</a>
    </div>

    <!-- Content Area -->
    <div class="content">
        <h2>Welcome, ${vendorName} 👋</h2>
        <p>This is your vendor dashboard where you can manage products, orders, and view your earnings.</p>

        <!-- Dashboard Cards -->
        <div class="row">
            <div class="col-md-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Products</h5>
                        <p class="card-text">${productCount}</p>
                        <a href="#" class="btn btn-primary btn-sm">Manage</a>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Orders</h5>
                        <p class="card-text">${orderCount}</p>
                        <a href="#" class="btn btn-primary btn-sm">View</a>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Earnings</h5>
                        <p class="card-text">₹${totalEarnings}</p>
                        <a href="#" class="btn btn-success btn-sm">Details</a>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Profile</h5>
                        <p class="card-text">Update Info</p>
                        <a href="#" class="btn btn-info btn-sm">Edit</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
