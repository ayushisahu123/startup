<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Add Product Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f8f9fa; }
    .card { border-radius: 12px; }
    .product-img { width: 80px; height: 80px; object-fit: cover; border-radius: 6px; }
    .form-section { display: none; }
    .active-section { display: block; }
    .table td, .table th { font-size: 15px; color: #212529; }
    .table td { white-space: normal; word-wrap: break-word; max-width: 250px; }
      #imagePreview img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        margin: 5px;
        border-radius: 6px;
        border: 1px solid #ddd;
      }
  </style>
</head>
<body>
<div class="container my-4">
  <h2 class="text-center mb-4">📦 Vendor Product Dashboard</h2>

    <!-- Display success message -->
    <c:if test="${not empty successMessage}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> ${successMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </c:if>


  <!-- Tabs -->
  <ul class="nav nav-tabs justify-content-center mb-4" id="productTabs">
    <li class="nav-item">
      <a class="nav-link active" href="#" data-target="singleForm">➕ Add Single Product</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" data-target="bulkUpload">📂 Bulk Upload (CSV)</a>
    </li>
  </ul>

  <!-- Single Product Form -->
  <div id="singleForm" class="form-section active-section">
    <div class="card shadow">
      <div class="card-body">
<form id="productForm"
      action="${pageContext.request.contextPath}/addNewProduct"
      method="post" enctype="multipart/form-data">

  <input type="hidden" name="vendorId" value="${sessionScope.vendorId}">

  <div class="row g-3">
    <div class="col-md-6">
      <label class="form-label">Product Name</label>
      <input type="text" class="form-control" id="productName" name="productName" required>
    </div>
    <div class="col-md-6">
      <label class="form-label">Price</label>
      <input type="number" class="form-control" id="productPrice" name="price" required>
    </div>
    <div class="col-md-6">
      <label class="form-label">Category</label>
      <select class="form-select" id="productCategory" name="categoryId" required>
        <option value="">Choose...</option>
        <option value="1">Electronics</option>
        <option value="2">Clothing</option>
        <option value="3">Books</option>
        <option value="4">Home Appliances</option>
      </select>
    </div>
    <div>
<div class="col-md-12">
  <label class="form-label">Upload Thumbnail Image</label>
  <input type="file" class="form-control" id="thumbnailImage" name="thumbnailImage" accept="image/*">
  <!-- Preview Area -->
  <div id="thumbnailPreview" class="d-flex flex-wrap mt-2"></div>
</div>
 <div class="col-md-12">
   <label class="form-label">Upload Images</label>
   <input type="file" class="form-control" id="productImages" name="images" multiple accept="image/*">
   <!-- Preview Area -->
   <div id="imagePreview" class="d-flex flex-wrap mt-2"></div>
 </div>

  </div>
    <div class="col-12">
      <label class="form-label">Description</label>
      <textarea class="form-control" id="productDesc" name="description" rows="2"></textarea>
    </div>
  </div>
  <button type="submit" class="btn btn-success mt-3">Add Product</button>
</form>

      </div>
    </div>
  </div>

  <!-- Bulk Upload CSV -->
  <div id="bulkUpload" class="form-section">
    <div class="card shadow">
      <div class="card-body text-center">
        <h5>Upload Products via CSV</h5>
        <p class="text-muted">Format: <code>Name,Price,Category,Description</code></p>
        <input type="file" id="csvFile" class="form-control mb-3" accept=".csv">
        <button class="btn btn-primary" id="uploadCSV">Upload CSV</button>
      </div>
    </div>
  </div>


<!-- Product List -->
<div class="card shadow mt-4">
  <div class="card-header bg-dark text-white">
    <h5 class="mb-0">My Products</h5>
  </div>
<table id="productTable" class="table table-bordered table-hover align-middle">
  <thead>
    <tr>
      <th>Name</th>
      <th>Price</th>
      <th>Category</th>
      <th>Description</th>
      <th>Remove</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="p" items="${products}">
      <tr>
        <td>${p.productName}</td>
        <td>₹${p.price}</td>
        <td>
          <c:choose>
            <c:when test="${p.categoryId == 1}">Electronics</c:when>
            <c:when test="${p.categoryId == 2}">Clothing</c:when>
            <c:when test="${p.categoryId == 3}">Books</c:when>
            <c:when test="${p.categoryId == 4}">Home Appliances</c:when>
            <c:otherwise>Other</c:otherwise>
          </c:choose>
        </td>
        <td>${p.description}</td>
        <td>
          <form action="${pageContext.request.contextPath}/deleteProduct" method="post">
            <input type="hidden" name="productId" value="${p.productId}">
            <button type="submit" class="btn btn-sm btn-danger">X</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<script>

 const tabs = document.querySelectorAll('#productTabs .nav-link');
  tabs.forEach(tab => {
    tab.addEventListener('click', function(e) {
      e.preventDefault();
      tabs.forEach(t => t.classList.remove('active'));
      this.classList.add('active');
      document.querySelectorAll('.form-section').forEach(sec => sec.classList.remove('active-section'));
      document.getElementById(this.dataset.target).classList.add('active-section');
    });
  });

  // Remove product row (frontend only)
  document.querySelectorAll(".remove-btn").forEach(btn => {
    btn.addEventListener("click", function() {
      this.closest("tr").remove();
    });
  });

  // CSV Upload (frontend preview only)
  function addProductToTable(name, price, category, desc) {
    const row = document.createElement("tr");
    row.innerHTML = `
      <td class="text-start fw-semibold">${name}</td>
      <td class="text-center">₹${price}</td>
      <td class="text-start">${category}</td>
      <td class="text-start">${desc}</td>
      <td class="text-center"><a href="${contextPath}/editProduct?id=${p.id}" class="btn btn-sm btn-warning">Edit</a></td>
    `;
    row.querySelector(".remove-btn").addEventListener("click", () => row.remove());
    document.querySelector("#productTable tbody").appendChild(row);

    productTable.appendChild(row);
  }

  document.getElementById("uploadCSV").addEventListener("click", function() {
    const file = document.getElementById("csvFile").files[0];
    if (!file) {
      alert("Please select a CSV file");
      return;
    }
    const reader = new FileReader();
    reader.onload = function(e) {
      const rows = e.target.result.split("\n").slice(1);
      rows.forEach(line => {
        const [name, price, category, desc] = line.split(",");
        if (name && price && category) {
          addProductToTable(name.trim(), price.trim(), category.trim(), desc ? desc.trim() : "");
        }
      });
    };
    reader.readAsText(file);
  });
</script>
<script>
// Preview multiple product images with remove button
document.getElementById("productImages").addEventListener("change", function(event) {
    const preview = document.getElementById("imagePreview");
    preview.innerHTML = ""; // Clear old previews

    const files = Array.from(event.target.files);

    files.forEach((file, index) => {
        const wrapper = document.createElement("div");
        wrapper.style.position = "relative";
        wrapper.style.display = "inline-block";

        wrapper.style.margin = "5px";

        const img = document.createElement("img");
        img.src = URL.createObjectURL(file);
        img.style.width = "120px";
        img.style.height = "120px";
        img.style.borderRadius = "6px";
        img.style.border = "1px solid #ddd";

        const removeBtn = document.createElement("span");
        removeBtn.innerHTML = "&times;";
        removeBtn.style.position = "absolute";
        removeBtn.style.top = "2px";
        removeBtn.style.right = "5px";
        removeBtn.style.background = "rgba(0,0,0,0.6)";
        removeBtn.style.color = "#fff";
        removeBtn.style.fontWeight = "bold";
        removeBtn.style.padding = "2px 6px";
        removeBtn.style.cursor = "pointer";
        removeBtn.style.borderRadius = "50%";
        removeBtn.title = "Remove";

        removeBtn.addEventListener("click", function() {
            wrapper.remove();
            // Remove the file from input.files
            const dt = new DataTransfer();
            files.forEach((f, i) => { if(i !== index) dt.items.add(f); });
            document.getElementById("productImages").files = dt.files;
        });

        wrapper.appendChild(img);
        wrapper.appendChild(removeBtn);
        preview.appendChild(wrapper);
    });
});

// Preview thumbnail image with remove button
document.getElementById("thumbnailImage").addEventListener("change", function(event) {
    const preview = document.getElementById("thumbnailPreview");
    preview.innerHTML = ""; // Clear old preview
    const file = event.target.files[0];
    if (file) {
        const wrapper = document.createElement("div");
        wrapper.style.position = "relative";
        wrapper.style.display = "inline-block";
        wrapper.style.margin = "5px";

        const img = document.createElement("img");
        img.src = URL.createObjectURL(file);
        img.style.width = "120px";
        img.style.height = "120px";
        img.style.borderRadius = "6px";
        img.style.border = "1px solid #ddd";

        const removeBtn = document.createElement("span");
        removeBtn.innerHTML = "&times;";
        removeBtn.style.position = "absolute";
        removeBtn.style.top = "2px";
        removeBtn.style.right = "5px";
        removeBtn.style.background = "rgba(0,0,0,0.6)";
        removeBtn.style.color = "#fff";
        removeBtn.style.fontWeight = "bold";
        removeBtn.style.padding = "2px 6px";
        removeBtn.style.cursor = "pointer";
        removeBtn.style.borderRadius = "50%";
        removeBtn.title = "Remove";

        removeBtn.addEventListener("click", function() {
            wrapper.remove();
            document.getElementById("thumbnailImage").value = "";
        });

        wrapper.appendChild(img);
        wrapper.appendChild(removeBtn);
        preview.appendChild(wrapper);
    }
});
</script>

</body>
</html>
