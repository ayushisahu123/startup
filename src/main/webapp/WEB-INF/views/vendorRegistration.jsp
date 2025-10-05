
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vendor Registration</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
      @import url("https://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap");
    body {
      background: url(/img/aesthetic-clear-blue-sky-background-summer-season-blue-pastel-colored-banner-blurred-sky-gradient-background-simple-soft-light-backdrop-gradient-template-design-vector.jpg)center/cover no-repeat;
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
      background: url("/img/flat-design-b2b-illustration_23-2149337639.jpg") no-repeat center center;
      background-size: cover;
      min-height: 100%;
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
<c:if test="${not empty message}">
  <div class="alert alert-info alert-dismissible fade show" role="alert">
    ${message}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</c:if>
<form:form modelAttribute="user" method="post"
           action="${pageContext.request.contextPath}/registerVendorRegistration"
           enctype="multipart/form-data">

    <!-- Vendor Name -> username -->
    <div class="mb-3">
        <label for="username" class="form-label">Vendor Name</label>
        <form:input path="username" cssClass="form-control" id="username" placeholder="Enter vendor name" required="true"/>
    </div>

    <div class="mb-3">
        <label for="businessName" class="form-label">Business Name</label>
        <form:input path="businessName" cssClass="form-control" id="businessName" placeholder="Enter business name" required="true"/>
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">Email Address</label>
        <form:input path="email" type="email" cssClass="form-control" id="email" placeholder="Enter email" required="true"/>
    </div>

<div class="mb-3">
    <label for="mobileNumber" class="form-label">Mobile Number</label>
    <form:input path="mobileNumber" cssClass="form-control" id="mobileNumber" placeholder="Enter mobile number" required="true"/>
</div>


    <div class="mb-3">
        <label for="address" class="form-label">Business Address</label>
        <form:textarea path="address" cssClass="form-control" id="address" rows="3" placeholder="Enter full address" required="true"/>
    </div>

    <div class="mb-3">
        <label for="category" class="form-label">Product Category</label>
        <form:select path="category" cssClass="form-select" id="category" required="true">
            <form:option value="" label="Choose category"/>
            <form:option value="Clothing"/>
            <form:option value="Electronics"/>
            <form:option value="Home & Kitchen"/>
            <form:option value="Beauty & Personal Care"/>
            <form:option value="Books"/>
            <form:option value="Other"/>
        </form:select>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="password" class="form-label">Create Password</label>
            <form:password path="password" cssClass="form-control" id="password" placeholder="Enter password" required="true"/>
        </div>
        <div class="col-md-6 mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm password" required>
        </div>
    </div>

    <div class="d-grid">
        <button type="submit" class="btn btn-primary btn-lg">Register</button>
    </div>
        <div class="text-center mt-3">
            <small>Already a vendor? <a href="${pageContext.request.contextPath}/vendorLogin">Login here</a></small>
        </div>
</form:form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <c:if test="${not empty message && message eq 'Registration successful!'}">
    <script>
      Swal.fire({
        title: 'Success!',
        text: 'Vendor registered successfully.',
        icon: 'success',
        confirmButtonText: 'Go to Dashboard',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = '<c:url value="/vendorDashboard" />';
        }
      });
    </script>
  </c:if>
</body>
</html>
