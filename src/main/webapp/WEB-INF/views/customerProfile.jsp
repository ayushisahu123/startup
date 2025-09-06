<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Customer Profile - Ecommerce</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .profile-card {
      border-radius: 15px;
      box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
    }
    .profile-pic {
      width: 120px;
      height: 120px;
      object-fit: cover;
      border-radius: 50%;
      border: 4px solid #fff;
      box-shadow: 0px 3px 6px rgba(0,0,0,0.2);
    }
    .nav-pills .nav-link.active {
      background-color: #0d6efd;
    }
  </style>
</head>
<body>

<div class="container py-5">
  <div class="row">
    <!-- Left Profile Section -->
    <div class="col-lg-4 mb-4">
      <div class="card profile-card text-center p-4">
        <img src="https://via.placeholder.com/120" alt="Profile Picture" class="profile-pic mx-auto">
        <h4 class="mt-3">Ayushi Sahu</h4>
        <p class="text-muted">ayushi@example.com</p>
        <p><i class="bi bi-geo-alt-fill"></i> Jabalpur, India</p>
        <button class="btn btn-primary btn-sm">Edit Profile</button>
      </div>
    </div>

    <!-- Right Info Section -->
    <div class="col-lg-8">
      <div class="card profile-card p-4">
        <!-- Navigation Tabs -->
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="orders-tab" data-bs-toggle="pill" data-bs-target="#orders" type="button" role="tab">My Orders</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="wishlist-tab" data-bs-toggle="pill" data-bs-target="#wishlist" type="button" role="tab">Wishlist</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="settings-tab" data-bs-toggle="pill" data-bs-target="#settings" type="button" role="tab">Settings</button>
          </li>
        </ul>

        <!-- Tab Content -->
        <div class="tab-content" id="pills-tabContent">
          <!-- Orders -->
          <div class="tab-pane fade show active" id="orders" role="tabpanel">
            <h5>Recent Orders</h5>
            <ul class="list-group">
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Order #12345 <span class="badge bg-success">Delivered</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Order #12346 <span class="badge bg-warning">Pending</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Order #12347 <span class="badge bg-danger">Cancelled</span>
              </li>
            </ul>
          </div>
          <!-- Wishlist -->
          <div class="tab-pane fade" id="wishlist" role="tabpanel">
            <h5>Wishlist</h5>
            <div class="row g-3">
