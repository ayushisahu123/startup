<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to bottom, #ffffff, #007bff);
      margin: 0;
    }

    .register-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 15px;
    }

    .image-side {
      background: url("/img/20943830.jpg") center/cover no-repeat;
      position: relative;
      color: white;
      padding: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .image-side::before {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.3);
    }

    .image-text {
      position: relative;
      font-size: 1.8rem;
      font-weight: 600;
      max-width: 300px;
      text-align: center;
      opacity: 0;
      transform: translateY(30px);
      animation: fadeSlide 1.2s ease-out forwards;
    }

    @keyframes fadeSlide {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }


    .form-side {

      padding: 30px;
      border-radius: 0 20px 20px 0;

    }

    .form-side h3 {
      color: #fff;
      font-size: 1.5rem;
    }

    .form-control {
      background: rgba(255, 255, 255, 0.25);
      border: none;
      color: #fff;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, 0.7);
    }

    .btn-primary:hover {
      background: linear-gradient(135deg, #764ba2, #667eea);
      transform: scale(1.05);
    }

    .checkbox-label {
      font-size: 0.75rem;
      color: white;
      display: flex;
      align-items: center;
      gap: 0.25rem;
      margin-bottom: 1.5rem;
    }

    .checkbox-label a {
      color: white;
      text-decoration: underline;
    }

    .btn-signup {
      color: white;
      font-size: 0.75rem;
      font-weight: 600;
      letter-spacing: 0.1em;
      padding: 0.5rem 2rem;
      border: none;
      cursor: pointer;
      background: linear-gradient(135deg, #667eea, #4219c6);
      transition: 0.3s ease;
    }

    .btn-signup:hover {
      background: linear-gradient(135deg, #764ba2, #667eea);
      transform: scale(1.05);
    }

    .member-link {
      font-size: 0.75rem;
      color:white;
      text-decoration: underline;
      margin-left: 1rem;
      align-self: center;
      cursor: pointer;
    }
    .input-group .btn {
  border-left: none !important;
  border-color: none;
}

    /* ✅ Responsive Fix - Keep Card Look */
    @media (max-width: 768px) {
      .row {
        flex-direction: column;
        max-width: 95%; /* keep card centered, not stretched */
        margin: 0 auto;
      }
      .image-side {
        min-height: 180px;
        border-radius: 20px 20px 0 0;
      }
      .form-side {
        border-radius: 0 0 20px 20px;
        padding: 20px;
      }
      .form-side h3 {
        text-align: center;
        font-size: 1.3rem;
      }
      .btn-signup {
        width: 100%;
      }
      .member-link {
        margin-left: 0;
        margin-top: 10px;
        display: block;
        text-align: center;
      }
    }
  </style>
</head>
<body>
  <div class="container-fluid register-container">
    <div class="row w-75 shadow-lg rounded-4 overflow-hidden">

      <!-- Left Image with Text -->
      <div class="col-md-6 image-side d-flex justify-content-center align-items-center">

      </div>

      <!-- Right Registration Form -->
      <div class="col-md-6 form-side">
        <h3 class="mb-4">Create Your Account with Us!!</h3>
        <form>
          <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" placeholder="Enter your name">
          </div>
          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" placeholder="Enter your email">
          </div>
          <div class="mb-3">
            <label class="form-label">Mobile Number</label>
            <input type="tel" class="form-control" placeholder="Enter mobile number">
          </div>
         <div class="mb-3">
  <label class="form-label">Password</label>
  <div class="input-group">
    <input type="password" class="form-control" id="password" placeholder="Enter password">
    <button class="btn btn-outline-light" type="button" id="togglePassword">
      <i class="fa-solid fa-eye" ></i>
    </button>
  </div>
</div>

          <div class="d-flex flex-column flex-md-row align-items-center">
            <button class="btn btn-signup mb-2 mb-md-0" type="submit">SIGN UP</button>
            <a class="member-link" href="#">I am already a member</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
<script>
  const togglePassword = document.querySelector("#togglePassword");
  const password = document.querySelector("#password");
  const icon = togglePassword.querySelector("i");

  togglePassword.addEventListener("click", function () {
    const type = password.getAttribute("type") === "password" ? "text" : "password";
    password.setAttribute("type", type);

    // Toggle eye / eye-slash
    if (type === "password") {
      icon.classList.remove("fa-eye-slash");
      icon.classList.add("fa-eye");
    } else {
      icon.classList.remove("fa-eye");
      icon.classList.add("fa-eye-slash");
    }
  });
</script>
</html>
