<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vendor Registration</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
      @import url("https://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap");
    body {
      background: url('/img/aesthetic-clear-blue-sky-background-summer-season-blue-pastel-colored-banner-blurred-sky-gradient-background-simple-soft-light-backdrop-gradient-template-design-vector.jpg')center/cover no-repeat;
    font-family: 'Roboto', sans-serif;
    }
    .registration-wrapper {
      max-width: 1000px;
      margin: 50px auto;
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
      border-radius: 15px;
      overflow: hidden;
      background: #fff;
      display: flex;
       align-items: stretch;
    }

    .registration-image {
      background: url('img/10178365.jpg') no-repeat center center;
      background-size: cover;   /* show full image without cropping */
      background-color: #f8f9fa;  /* fallback background behind image */

     flex: 1;


    }
    .registration-form {
      padding: 40px;
    }
    .registration-form h3 {
      font-weight: bold;
      color: #333;
      margin-bottom: 20px;
    }
    .form-control:focus {
      box-shadow: none;
      border-color: #0d6efd;
    }

  </style>
</head>
<body>

  <div class="container">
    <div class="row registration-wrapper">

      <!-- Left Image Section (hidden on small screens) -->
      <div class="col-md-6 d-none d-md-block registration-image"></div>

      <!-- Right Form Section -->
      <div class="col-md-6 registration-form">
        <h3 class="text-center">Grow Your Business with Us <br> Join as a Seller Today!</h3>
        <form>
          <!-- Vendor Details -->
          <div class="mb-3">
            <label for="vendorName" class="form-label">Vendor Name</label>
            <input type="text" class="form-control" id="vendorName" placeholder="Enter vendor name" required>
          </div>

          <div class="mb-3">
            <label for="businessName" class="form-label">Business Name</label>
            <input type="text" class="form-control" id="businessName" placeholder="Enter business name" required>
          </div>

          <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email" required>
          </div>

          <div class="mb-3">
            <label for="phone" class="form-label">Phone Number</label>
            <input type="tel" class="form-control" id="phone" placeholder="Enter phone number" required>
          </div>

          <!-- Address -->
          <div class="mb-3">
            <label for="address" class="form-label">Business Address</label>
            <textarea class="form-control" id="address" rows="3" placeholder="Enter full address" required></textarea>
          </div>

          <!-- Category -->
          <div class="mb-3">
            <label for="category" class="form-label">Product Category</label>
            <select class="form-select" id="category" required>
              <option value="" disabled selected>Choose category</option>
              <option>Clothing</option>
              <option>Electronics</option>
              <option>Home & Kitchen</option>
              <option>Beauty & Personal Care</option>
              <option>Books</option>
              <option>Other</option>
            </select>
          </div>

          <!-- Upload -->
          <div class="mb-3">
            <label for="license" class="form-label">Upload Business License</label>
            <input type="file" class="form-control" id="license" required>
          </div>

          <!-- Password -->
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="password" class="form-label">Create Password</label>
              <input type="password" class="form-control" id="password" placeholder="Enter password" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="confirmPassword" class="form-label">Confirm Password</label>
              <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm password" required>
            </div>
          </div>

          <!-- Agreement -->
          <div class="mb-3">
               <a href="#">I'm already a seller !</a>
            </label>
          </div>

          <!-- Submit -->
          <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-lg">Register</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
