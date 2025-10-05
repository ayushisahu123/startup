<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Products</title>
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

  <c:if test="${not empty errorMessage}">
    <div class="alert alert-danger text-center">${errorMessage}</div>
  </c:if>

  <c:if test="${empty products}">
    <div class="text-center text-muted">No products found.</div>
  </c:if>

  <div class="row">
    <c:forEach var="p" items="${products}">
      <div class="col-md-4 col-sm-6 mb-4">
        <div class="card product-card shadow-sm h-100">
          <c:choose>
                  <c:when test="${not empty p.imageUrl}">
                    <img src="${p.imageUrl}" class="card-img-top product-img" alt="${p.productName}">
                  </c:when>
                  <c:otherwise>
                    <img src="https://via.placeholder.com/400x250.png?text=No+Image" class="card-img-top product-img" alt="No image available">
                  </c:otherwise>
                </c:choose>
          <div class="card-body d-flex flex-column">
            <h5 class="card-title">${p.productName}</h5>
            <p class="card-text text-muted mb-1">₹${p.price}</p>
            <p class="text-secondary small mb-2">Category: ${p.categoryId}</p>
            <p class="card-text flex-grow-1">${p.description}</p>
            <div class="mt-auto text-end">
              <a href="editProduct?id=${p.productId}" class="btn btn-sm btn-warning">Edit</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

</body>
</html>
