<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<header class="border-bottom">
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

      <!-- If user is logged in -->
      <c:if test="${pageContext.request.userPrincipal != null}">
        <div class="dropdown">
          <button
            class="btn btn-link text-decoration-none d-flex align-items-center gap-1 text-dark p-0 login-dropdown-toggle"
            type="button"
            id="loginDropdown"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <i class="far fa-user login-icon"></i>
            <span class="text-decoration-none">
              ${pageContext.request.userPrincipal.name}
            </span>
            <i class="fas fa-caret-down ms-1"></i>
          </button>
          <ul class="dropdown-menu login-dropdown-menu" aria-labelledby="loginDropdown">
            <li><a class="dropdown-item" href="#">My Profile</a></li>
            <li><a class="dropdown-item" href="#">Orders</a></li>
            <li><a class="dropdown-item" href="#">Wishlist</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li>
<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
    <button type="submit" class="dropdown-item">Logout</button>
</form>            </li>
          </ul>
        </div>
      </c:if>

      <!-- If user is not logged in -->
      <c:if test="${pageContext.request.userPrincipal == null}">
        <a class="btn btn-link text-decoration-none d-flex align-items-center gap-1 text-dark p-0"
           href="${pageContext.request.contextPath}/login">
          <i class="far fa-user login-icon"></i>
          <span>Login</span>
        </a>
      </c:if>

      <!-- Cart Button -->
      <button type="button" class="btn text-decoration-none btn-link d-flex align-items-center gap-1 text-dark p-0">
        <i class="fas fa-shopping-cart cart-icon"></i>
        <span>Cart</span>
      </button>

      <!-- Seller Button -->
    <!-- Show Become a Seller only if NOT vendor -->
<sec:authorize access="!hasRole('ROLE_VENDOR') and !hasRole('ROLE_CUSTOMER')">
    <a href="${pageContext.request.contextPath}/registerVendor"
       class="btn btn-link text-decoration-none d-flex align-items-center gap-1 text-dark p-0">
        <i class="fas fa-store seller-icon"></i>
        <span>Become a Seller</span>
    </a>
</sec:authorize>
      <!-- More Options -->
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
