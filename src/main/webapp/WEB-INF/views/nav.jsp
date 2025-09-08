<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Flipkart Header Bootstrap</title>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
  />
  <style>
    body {
      padding-top: 70px; /* Prevent content from hiding behind navbar */
    }

    .flipkart-logo {
      font-style: italic;
      font-weight: 800;
      font-size: 1.25rem;
      color: #2874f0;
      user-select: none;
    }
    .explore-plus {
      font-style: italic;
      font-weight: 700;
      font-size: 0.65rem;
      color: #f2a900;
      display: flex;
      align-items: center;
      gap: 0.15rem;
      user-select: none;
    }
    .explore-text {
      font-style: italic;
      font-weight: 600;
      font-size: 0.65rem;
      color: #6b7280; /* gray-600 */
      user-select: none;
      line-height: 1;
    }
    .search-input {
      background-color: #ebf2ff;
      border-radius: 0.5rem;
      border: none;
      padding-left: 2.5rem;
      height: 2.5rem;
      color: #374151; /* gray-700 */
    }
    .search-input::placeholder {
      color: #6b7280; /* gray-500 */
    }
    .search-icon {
      position: absolute;
      left: 0.75rem;
      top: 50%;
      transform: translateY(-50%);
      color: #6b7280;
      pointer-events: none;
    }
    .login-dropdown-toggle::after {
      display: none;
    }
    .login-dropdown-menu {
      min-width: 8rem;
    }
    .login-icon {
      font-size: 1.125rem;
      margin-right: 0.25rem;
    }
    .cart-icon,
    .seller-icon {
      font-size: 1.125rem;
      margin-right: 0.25rem;
    }
    .dots-icon {
      font-size: 1.25rem;
      cursor: pointer;
    }
    @media (max-width: 576px) {
      .search-input {
        height: 2rem;
        font-size: 0.875rem;
      }
      .flipkart-logo {
        font-size: 1rem;
      }
      .explore-text,
      .explore-plus {
        font-size: 0.55rem;
      }
      .nav-link {
        font-size: 0.875rem;
      }
      .cart-icon,
      .seller-icon,
      .login-icon {
        font-size: 1rem;
      }
      .navbar {
        background-color: rgba(255, 255, 255, 0.2); /* light transparent */
        backdrop-filter: blur(10px); /* blur background */
        -webkit-backdrop-filter: blur(10px); /* Safari support */
        border-bottom: 1px solid rgba(255, 255, 255, 0.3);
      }
    }
  </style>
</head>
<body>
  <header class="border-bottom navbar fixed-top bg-white">
    <div class="container-fluid px-3 py-2 d-flex align-items-center justify-content-between flex-wrap">
      <div class="d-flex align-items-center gap-1">
        <span class="flipkart-logo">Youwantt</span>
      </div>

      <form class="position-relative flex-grow-1 mx-3" style="max-width: 600px;">
        <input
          type="search"
          class="form-control search-input"
          placeholder="Search for Products, Brands and More"
          aria-label="Search for Products, Brands and More"
        />
        <i class="fas fa-search search-icon"></i>
      </form>

      <nav class="d-flex align-items-center gap-3 flex-wrap">
        <div class="dropdown">
          <button
            class="btn btn-link text-decoration-none d-flex align-items-center gap-1 text-dark p-0 login-dropdown-toggle"
            type="button"
            id="loginDropdown"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <i class="far fa-user login-icon"></i>
            <span class="text-decoration-none">Login</span>
            <i class="fas fa-caret-down ms-1"></i>
          </button>
          <ul class="dropdown-menu login-dropdown-menu" aria-labelledby="loginDropdown">
            <li><a class="dropdown-item" href="#">My Profile</a></li>
            <li><a class="dropdown-item" href="#">Orders</a></li>
            <li><a class="dropdown-item" href="#">Wishlist</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </div>

        <button type="button" class="btn text-decoration-none btn-link d-flex align-items-center gap-1 text-dark p-0">
          <i class="fas fa-shopping-cart cart-icon"></i>
          <span>Cart</span>
        </button>

        <button type="button" id="sellerbtn"class="btn btn-link text-decoration-none d-flex align-items-center gap-1 text-dark p-0">
          <i class="fas fa-store seller-icon"></i>
          <span>Become a Seller</span>
        </button>

        <div class="dropdown">
          <button
            class="btn btn-link text-decoration-none text-dark p-0 dots-icon"
            type="button"
            id="moreDropdown"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            aria-label="More options"
          >
            <i class="fas fa-ellipsis-v"></i>
          </button>
          <ul class="dropdown-menu" aria-labelledby="moreDropdown">
            <li><a class="dropdown-item" href="#">Notification Preferences</a></li>
            <li><a class="dropdown-item" href="#">24x7 Customer Care</a></li>
            <li><a class="dropdown-item" href="#">Advertise</a></li>
            <li><a class="dropdown-item" href="#">Download App</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </header>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 <script>
   document.getElementById("sellerbtn").addEventListener("click", function() {
     alert("Redirecting to Seller Registration Page...");
     window.location.href = "<%= request.getContextPath() %>/registerVendor";
   });
 </script>
</body>

</html>
