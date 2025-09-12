<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1" name="viewport"/>
  <title>
  Youwantt
  </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
 <style>
 @import url("https://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap");
 *{
     margin:0px;
     padding:0px;
     box-sizing: border-box;
     font-family:"Spartan", sans-serif;

 }

 body {
       font-family: 'Roboto', sans-serif;
       background-color:#f9f6fb;
       color: #111315;
     }

     .navbar {
   background-color: rgba(255, 255, 255, 0.2); /* light transparent */
   backdrop-filter: blur(10px); /* blur background */
   -webkit-backdrop-filter: blur(10px); /* Safari support */
   border-bottom: 1px solid rgba(255, 255, 255, 0.3);
 }

 .hero {
       position: relative;
       width: 100%;
       height: 100vh; /* full screen height */
       background: url('/img/bg.jpg') no-repeat center center/cover;
       display: flex;
       justify-content: center;
       align-items: center;
       color: white;
       text-align: center;
     }

     /* Overlay (for text readability) */
     .hero::after {
       content: "";
       position: absolute;
       top: 0; left: 0; right: 0; bottom: 0;
       background: rgba(0, 0, 0, 0.5); /* dark overlay */
     }

     .hero-content {
       position: relative; /* so text appears above overlay */
       z-index: 1;
       max-width: 90%;
        top: 10%;
       left: 0%;                  /* push to left side */
        transform: translate(0, -50%);
        color: white;
     }
     .hero-content p{
         font-size: 20px;
         color: #f9f6fb;
     }

     .hero h1 {
       font-size: 3rem;
       margin-bottom: 1rem;
     }

     .hero p {
       font-size: 1.2rem;
       margin-bottom: 2rem;
     }

     .btn {
       padding: 0.8rem 1.5rem;
       background: #ff5722;
       color: white;
       border: none;
       font-size: 1rem;
       border-radius: 5px;
       cursor: pointer;
     }

     .btn:hover {
       background: #e64a19;
     }

     /* Responsive text */
     @media (max-width: 768px) {
       .hero h1 {
         font-size: 2rem;
       }
       .hero p {
         font-size: 1rem;
       }
     }
     .btn-primary {
       background-color: #2563eb;
       border: none;
     }
     .btn-primary:hover {
       background-color: #1e40af;
     }
     .feature-icon {
       font-size: 2.5rem;
       color: #2563eb;
     }
     .product-card img {
       object-fit: contain;
       height: 180px;
       width: 100%;
     }
     .seller-badge {
       background-color: #2563eb;
       color: white;
       font-size: 0.75rem;
       padding: 0.15rem 0.5rem;
       border-radius: 0.25rem;
       position: absolute;
       top: 0.5rem;
       left: 0.5rem;
       font-weight: 600;
     }
      @media (max-width: 575.98px) {
       .hero-img {
         height: 250px;
         object-fit: cover;
         width: 100%;
       }
     }

 </style>
 </head>
 <body>
  <jsp:include page="nav.jsp" />
  <!-- Hero Section -->
  <section class="py-5 bg-white hero">
   <!-- <div class="container d-flex flex-column flex-lg-row align-items-center gap-4">
    <div class="text-center text-lg-start flex-grow-1">
     <h1 class="display-5 fw-bold mb-3">
      Your One-Stop Marketplace for Mobile Accessories
     </h1>
     <p class="lead text-secondary mb-4">
      Discover, buy, and sell the latest mobile accessories from multiple trusted sellers all in one place.
     </p>
     <div class="d-flex justify-content-center justify-content-lg-start gap-3 flex-wrap">
      <a class="btn btn-primary btn-lg px-4 fw-semibold" href="${pageContext.request.contextPath}/registerVendor">
       Start Selling
      </a>
      <a class="btn btn-outline-primary btn-lg px-4 fw-semibold" href="${pageContext.request.contextPath}/login">
       Shop Now
      </a>
     </div>
    </div>
    <div class="flex-shrink-0">
     <img alt="heroo" class="hero-img rounded shadow" height="400" src="images/output.jpg" width="500"/>
    </div>
   </div> -->
<div class="hero-content">
       <div class="text-center text-lg-start flex-grow-1">
     <h1 class="display-5 fw-bold mb-3">
      Your One-Stop Marketplace
      <br>for Mobile Accessories
     </h1>
     <p class="lead text-secondary mb-4">
      Discover, buy, and sell the latest mobile accessories from multiple trusted sellers all in one place.
     </p>

<div class="d-flex justify-content-center justify-content-lg-start gap-3 flex-wrap">
    <a class="btn btn-primary btn-lg px-4 fw-semibold"
       href="${pageContext.request.contextPath}/registerVendor">
        Start Selling
    </a>

    <c:choose>
        <c:when test="${pageContext.request.userPrincipal != null}">
            <!-- Agar user logged in hai -->
            <a class="btn btn-outline-primary btn-lg px-4 fw-semibold"
               href="${pageContext.request.contextPath}/">
                Shop Now
            </a>
        </c:when>
        <c:otherwise>
            <!-- Agar user login nahi hai -->
            <a class="btn btn-outline-primary btn-lg px-4 fw-semibold"
               href="${pageContext.request.contextPath}/login">
                Shop Now
            </a>
        </c:otherwise>
    </c:choose>
</div>
 </div>
    </div>
</section>
  <!-- Features Section -->
  <section class="py-5 bg-light" id="features">
   <div class="container text-center">
    <h2 class="fw-bold mb-5">
     Why Choose youwantt?
    </h2>
    <div class="row g-4">
     <div class="col-12 col-md-4">
      <div class="p-4 bg-white rounded shadow-sm h-100 d-flex flex-column align-items-center">
       <i class="fas fa-store feature-icon mb-3">
       </i>
       <h5 class="fw-semibold mb-2">
        Multiple Sellers
       </h5>
       <p class="text-secondary">
        A diverse range of sellers offering a wide variety of mobile accessories to choose from.
       </p>
      </div>
     </div>
     <div class="col-12 col-md-4">
      <div class="p-4 bg-white rounded shadow-sm h-100 d-flex flex-column align-items-center">
       <i class="fas fa-cogs feature-icon mb-3">
       </i>
       <h5 class="fw-semibold mb-2">
        Easy Management
       </h5>
       <p class="text-secondary">
        Sellers can easily list, manage, and track their products with our intuitive dashboard.
       </p>
      </div>
     </div>
     <div class="col-12 col-md-4">
      <div class="p-4 bg-white rounded shadow-sm h-100 d-flex flex-column align-items-center">
       <i class="fas fa-shield-alt feature-icon mb-3">
       </i>
       <h5 class="fw-semibold mb-2">
        Secure Payments
       </h5>
       <p class="text-secondary">
        Safe and reliable payment processing for buyers and sellers alike.
       </p>
      </div>
     </div>
    </div>
   </div>
  </section>
  <!-- Products Section -->
  <section class="py-5" id="products">
   <div class="container">
    <h2 class="fw-bold mb-4 text-center">
     Featured Products
    </h2>
    <div class="row g-4">
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: TechWorld
       </span>
       <img alt="Wireless earbuds with sleek black design and charging case on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/107c48f2-85c8-474d-e690-97552cce0208.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Wireless Earbuds
        </h6>
        <p class="card-text text-primary fw-bold">
         $49.99
        </p>
       </div>
      </div>
     </div>
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: MobileGear
       </span>
       <img alt="Fast charging USB-C cable with braided nylon exterior on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/31aa6cd3-5e09-4392-3848-e01421e43d55.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Fast Charging Cable
        </h6>
        <p class="card-text text-primary fw-bold">
         $15.99
        </p>
       </div>
      </div>
     </div>
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: GadgetHub
       </span>
       <img alt="Transparent protective phone case with shock absorption design on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/2d732809-f8d5-4507-dc65-9b3a46918b19.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Protective Phone Case
        </h6>
        <p class="card-text text-primary fw-bold">
         $19.99
        </p>
       </div>
      </div>
     </div>
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: TechWorld
       </span>
       <img alt="Round wireless charging pad with LED indicator on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/6b5e49a9-206c-40ac-7ff5-5d4a9add7b98.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Wireless Charging Pad
        </h6>
        <p class="card-text text-primary fw-bold">
         $29.99
        </p>
       </div>
      </div>
     </div>
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: MobileGear
       </span>
       <img alt="Compact Bluetooth speaker with black mesh grille on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/2c627174-d2ca-443c-80ee-799d9a0c813e.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Bluetooth Speaker
        </h6>
        <p class="card-text text-primary fw-bold">
         $39.99
        </p>
       </div>
      </div>
     </div>
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: GadgetHub
       </span>
       <img alt="Tempered glass screen protector for smartphone on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/646c00a9-4972-4bca-cfa7-cfc91c0fcf02.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Screen Protector
        </h6>
        <p class="card-text text-primary fw-bold">
         $9.99
        </p>
       </div>
      </div>
     </div>
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: TechWorld
       </span>
       <img alt="Slim portable power bank with USB ports on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/f28c78e2-c7dd-4627-4d73-7a71173e2049.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Portable Power Bank
        </h6>
        <p class="card-text text-primary fw-bold">
         $34.99
        </p>
       </div>
      </div>
     </div>
     <div class="col-6 col-md-4 col-lg-3">
      <div class="card product-card position-relative shadow-sm">
       <span class="seller-badge">
        Seller: MobileGear
       </span>
       <img alt="Adjustable car phone mount with suction cup on white background" class="card-img-top" height="300" src="https://storage.googleapis.com/a1aa/image/1508dcfe-909d-44f2-f1b5-eaaf3ef9246d.jpg" width="400"/>
       <div class="card-body">
        <h6 class="card-title fw-semibold">
         Car Phone Mount
        </h6>
        <p class="card-text text-primary fw-bold">
         $22.99
        </p>
       </div>
      </div>
     </div>
    </div>
   </div>
  </section>
  <!-- Sellers Section -->
  <section class="py-5 bg-light" id="sellers">
   <div class="container text-center">
    <h2 class="fw-bold mb-5">
     Meet Our Top Sellers
    </h2>
    <div class="row g-4 justify-content-center">
     <div class="col-6 col-sm-4 col-md-3 col-lg-2">
      <div class="card border-0 bg-white shadow-sm rounded-circle p-3 d-flex align-items-center justify-content-center" style="height: 120px; width: 120px; margin: 0 auto;">
       <img alt="Logo of TechWorld seller, a blue and white stylized tech icon" class="rounded-circle" height="100" src="https://storage.googleapis.com/a1aa/image/e80e4b0c-b32f-46cc-2547-44cf08b3b75a.jpg" width="100"/>
      </div>
      <h6 class="mt-3 fw-semibold">
       TechWorld
      </h6>
     </div>
     <div class="col-6 col-sm-4 col-md-3 col-lg-2">
      <div class="card border-0 bg-white shadow-sm rounded-circle p-3 d-flex align-items-center justify-content-center" style="height: 120px; width: 120px; margin: 0 auto;">
       <img alt="Logo of MobileGear seller, a green and black gear icon" class="rounded-circle" height="100" src="https://storage.googleapis.com/a1aa/image/c4920e3c-8c63-41f8-f045-74f018ff8fc9.jpg" width="100"/>
      </div>
      <h6 class="mt-3 fw-semibold">
       MobileGear
      </h6>
     </div>
     <div class="col-6 col-sm-4 col-md-3 col-lg-2">
      <div class="card border-0 bg-white shadow-sm rounded-circle p-3 d-flex align-items-center justify-content-center" style="height: 120px; width: 120px; margin: 0 auto;">
       <img alt="Logo of GadgetHub seller, a red and black stylized gadget icon" class="rounded-circle" height="100" src="https://storage.googleapis.com/a1aa/image/c09fd600-6c31-4ba4-d3e5-f922c3f9dade.jpg" width="100"/>
      </div>
      <h6 class="mt-3 fw-semibold">
       GadgetHub
      </h6>
     </div>
     <div class="col-6 col-sm-4 col-md-3 col-lg-2">
      <div class="card border-0 bg-white shadow-sm rounded-circle p-3 d-flex align-items-center justify-content-center" style="height: 120px; width: 120px; margin: 0 auto;">
       <img alt="Logo of Accessory Mart seller, a purple and white abstract accessory icon" class="rounded-circle" height="100" src="https://storage.googleapis.com/a1aa/image/58ca6c71-dee9-4244-25f7-e6c3407f3a16.jpg" width="100"/>
      </div>
      <h6 class="mt-3 fw-semibold">
       Accessory Mart
      </h6>
     </div>
     <div class="col-6 col-sm-4 col-md-3 col-lg-2">
      <div class="card border-0 bg-white shadow-sm rounded-circle p-3 d-flex align-items-center justify-content-center" style="height: 120px; width: 120px; margin: 0 auto;">
       <img alt="Logo of Phone Plus seller, a yellow and black phone icon" class="rounded-circle" height="100" src="https://storage.googleapis.com/a1aa/image/a118599c-8300-4dba-eecd-00e39697d5d3.jpg" width="100"/>
      </div>
      <h6 class="mt-3 fw-semibold">
       Phone Plus
      </h6>
     </div>
    </div>
   </div>
  </section>
  <!-- Call to Action Section -->
  <section class="py-5 bg-white text-center">
   <div class="container">
    <h2 class="fw-bold mb-3">
     Ready to Join the Marketplace?
    </h2>
    <p class="mb-4 text-secondary fs-5">
     Whether you want to sell or shop, MobileHub makes it easy and secure.
    </p>
    <a class="btn btn-primary btn-lg px-5 fw-semibold me-3" href="#">
     Create an Account
    </a>
    <a class="btn btn-outline-primary btn-lg px-5 fw-semibold" href="#contact">
     Contact Us
    </a>
   </div>
  </section>
  <!-- Contact Section -->
  <section class="py-5 bg-light" id="contact">
   <div class="container">
    <h2 class="fw-bold mb-4 text-center">
     Get in Touch
    </h2>
    <div class="row justify-content-center">
     <div class="col-12 col-md-8 col-lg-6">
      <form>
       <div class="mb-3">
        <label class="form-label fw-semibold" for="name">
         Name
        </label>
        <input class="form-control" id="name" placeholder="Your full name" required="" type="text"/>
       </div>
       <div class="mb-3">
        <label class="form-label fw-semibold" for="email">
         Email address
        </label>
        <input class="form-control" id="email" placeholder="name@example.com" required="" type="email"/>
       </div>
       <div class="mb-3">
        <label class="form-label fw-semibold" for="message">
         Message
        </label>
        <textarea class="form-control" id="message" placeholder="Write your message here..." required="" rows="4"></textarea>
       </div>
       <div class="d-grid">
        <button class="btn btn-primary btn-lg fw-semibold" type="submit">
         Send Message
        </button>
       </div>
      </form>
     </div>
    </div>
   </div>
  </section>
  <!-- Footer -->
  <footer class="bg-white py-4 mt-5 shadow-sm">
   <div class="container d-flex flex-column flex-md-row justify-content-between align-items-center">
    <p class="mb-2 mb-md-0 text-secondary">
     © 2024 MobileHub. All rights reserved.
    </p>
    <div class="d-flex gap-3">
     <a aria-label="Facebook" class="text-secondary fs-5" href="#">
      <i class="fab fa-facebook-f">
      </i>
     </a>
     <a aria-label="Twitter" class="text-secondary fs-5" href="#">
      <i class="fab fa-twitter">
      </i>
     </a>
     <a aria-label="Instagram" class="text-secondary fs-5" href="#">
      <i class="fab fa-instagram">
      </i>
     </a>
     <a aria-label="LinkedIn" class="text-secondary fs-5" href="#">
      <i class="fab fa-linkedin-in">
      </i>
     </a>
    </div>
   </div>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
  </script>
 </body>
</html>
