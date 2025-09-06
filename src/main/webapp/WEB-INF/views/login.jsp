<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Login - YourStore</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to bottom, #ffffff, #007bff);
    }
    .login-container {
      min-height: 100vh;
    }
    .login-card {
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }
    .login-image {
      background: url('/img/20944201.jpg') no-repeat center center;
      background-size: cover;
      border-radius: 20px 0 0 20px;

    }
    .form-control:focus {
      box-shadow: none;
      border-color: #0d6efd;
    }
    .btn-custom {
      background: #0d6efd;
      color: #fff;
      transition: 0.3s;
    }
    .btn-custom:hover {
      background: #0b5ed7;
    }
  </style>
</head>
<body>

<div class="container login-container d-flex justify-content-center align-items-center">
  <div class="row w-75 shadow-lg login-card bg-white">

    <!-- Left Image Section -->
    <div class="col-lg-6 d-none d-lg-block login-image">
    </div>

    <!-- Login Form Section -->
    <div class="col-lg-6 p-5">
      <h2 class="mb-4 fw-bold text-center">Welcome Back !!!</h2>
      <p class="text-center text-muted">Login to continue shopping with us</p>

      <form>
        <div class="mb-3">
          <label for="email" class="form-label">Email address</label>
          <input type="email" class="form-control" id="email" placeholder="Enter your email">
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" id="password" placeholder="Enter your password">
        </div>

        <div class="d-flex justify-content-between mb-3">
          <div>
            <input type="checkbox" id="remember">
            <label for="remember" class="text-muted">Remember me</label>
          </div>
          <a href="#" class="text-decoration-none">Forgot Password?</a>
        </div>

        <button type="submit" class="btn btn-custom w-100">Login</button>
      </form>

      <p class="mt-4 text-center text-muted"> Dont have an account? <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">Sign Up</a></p>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
