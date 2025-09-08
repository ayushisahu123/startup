<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1" name="viewport"/>
  <title>
   Vendor Login - E-commerce
  </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet"/>
  <style>
   body {
      font-family: 'Inter', sans-serif;
      background-color: #f8f9fa;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 1.5rem;
    }
    .login-wrapper {
      max-width: 900px;
      width: 100%;
      background: #fff;
      border-radius: 0.5rem;
      box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 0.1);
      overflow: hidden;
      display: flex;
      flex-wrap: wrap;
      min-height: 520px;
    }
    .login-image {
      flex: 1 1 50%;
      display: none;
      position: relative;
    }
    .login-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
    }
    .login-container {
      flex: 1 1 50%;
      padding: 2.5rem 3rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
      max-width: 420px;
      width: 100%;
    }
    .login-header {
      margin-bottom: 2rem;
      text-align: center;
    }
    .login-header img {
      width: 80px;
      margin-bottom: 1rem;
    }
    .form-control:focus {
      box-shadow: 0 0 0 0.25rem rgba(13,110,253,.25);
      border-color: #0d6efd;
    }
    .btn-primary {
      width: 100%;
      font-weight: 600;
      padding: 0.75rem;
      font-size: 1.1rem;
    }
    @media (min-width: 992px) {
      .login-image {
        display: block;
      }
    }
    @media (max-width: 576px) {
      .login-container {
        padding: 2rem 1.5rem;
        max-width: 100%;
      }
      .login-wrapper {
        min-height: auto;
        box-shadow: none;
        border-radius: 0;
      }
    }
  </style>
 </head>
 <body>
  <main class="login-wrapper">
   <div class="login-image">
    <img alt="Modern e-commerce vendor working on laptop in bright office with shelves and plants" height="800" src="https://storage.googleapis.com/a1aa/image/0f15f036-23f4-4da2-32e4-1f04350a743f.jpg" width="600"/>
   </div>
   <div class="login-container">
    <div class="login-header">
     <img alt="E-commerce vendor portal logo, blue and white stylized shopping cart icon" height="80" src="https://storage.googleapis.com/a1aa/image/7398523a-0dea-48f5-0851-16c0b47c94d9.jpg" width="80"/>
     <h1 class="h4 fw-bold">
      Vendor Login
     </h1>
     <p class="text-muted">
      Access your vendor dashboard
     </p>
    </div>
    <form>
     <div class="mb-3">
      <label class="form-label" for="vendorEmail">
       Email address
      </label>
      <input autofocus="" class="form-control" id="vendorEmail" placeholder="vendor@example.com" required="" type="email"/>
     </div>
     <div class="mb-3">
      <label class="form-label" for="vendorPassword">
       Password
      </label>
      <input class="form-control" id="vendorPassword" placeholder="Enter your password" required="" type="password"/>
     </div>
     <div class="mb-3 form-check d-flex justify-content-between align-items-center">
      <div>
       <input class="form-check-input" id="rememberMe" type="checkbox"/>
       <label class="form-check-label" for="rememberMe">
        Remember me
       </label>
      </div>
      <a class="text-primary text-decoration-none" href="#" style="font-size: 0.9rem;">
       Forgot password?
      </a>
     </div>
     <button class="btn btn-primary" type="submit">
      Log In
     </button>
    </form>
    <div class="mt-4 text-center text-muted" style="font-size: 0.9rem;">
     Don't have an account?
     <a class="text-primary text-decoration-none" href="${pageContext.request.contextPath}/registerVendor"">
      Register as Vendor
     </a>
    </div>
   </div>
  </main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
  </script>
 </body>
</html>


