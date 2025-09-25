<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Vendor Products</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f8f9fa; }
    .product-card { border-radius: 12px; transition: transform 0.2s; }
    .product-card:hover { transform: translateY(-5px); }
    .product-img { height: 180px; object-fit: cover; border-radius: 12px 12px 0 0; }
  </style>
</head>
<body>
<div class="container py-4">
  <h2 class="text-center mb-4">📦 My Products</h2>


  <div class="row" id="productGrid"></div>
</div>

<script>

  const contextPath = '<%= request.getContextPath() %>';


  const products = [
    {
      id: 1,
      name: "Smartphone",
      price: 20000,
      category: "Electronics",
      desc: "Latest 5G Android smartphone.",
      image: "https://via.placeholder.com/400x250.png?text=Smartphone"
    },
    {
      id: 2,
      name: "T-Shirt",
      price: 499,
      category: "Clothing",
      desc: "100% cotton, summer collection.",
      image: "https://via.placeholder.com/400x250.png?text=T-Shirt"
    },
    {
      id: 3,
      name: "Microwave Oven",
      price: 7999,
      category: "Home Appliances",
      desc: "Convection microwave oven with grill.",
      image: "https://via.placeholder.com/400x250.png?text=Microwave"
    }
  ];

  const productGrid = document.getElementById("productGrid");

  function renderProducts() {
    productGrid.innerHTML = "";
    products.forEach(p => {
      const col = document.createElement("div");
      col.className = "col-md-4 col-sm-6 mb-4";

      col.innerHTML = ` <div class="card product-card shadow-sm h-100">
                                 <img src="${p.image}" class="card-img-top product-img" alt="${p.name}">
                                 <div class="card-body d-flex flex-column">
                                   <h5 class="card-title">${p.name}</h5>
                                   <p class="card-text text-muted mb-1">₹${p.price}</p>
                                   <p class="text-secondary small mb-2">${p.category}</p>
                                   <p class="card-text flex-grow-1">${p.desc}</p>
                                   <div class="mt-auto text-end">
                                     <a href="${contextPath}/editProduct?id=${p.id}" class="btn btn-sm btn-warning">Edit</a>
                                   </div>
                                 </div>
                               </div>
                               `;


      productGrid.appendChild(col);
    });
  }

  renderProducts();
</script>
</body>
</html>
