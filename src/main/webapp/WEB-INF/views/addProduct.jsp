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
  </style>
</head>
<body>
<div class="container my-4">
  <h2 class="text-center mb-4">📦 Vendor Product Dashboard</h2>

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
        <form id="productForm">
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Product Name</label>
              <input type="text" class="form-control" id="productName" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Price</label>
              <input type="number" class="form-control" id="productPrice" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Category</label>
              <select class="form-select" id="productCategory" required>
                <option value="">Choose...</option>
                <option>Electronics</option>
                <option>Clothing</option>
                <option>Books</option>
                <option>Home Appliances</option>
              </select>
            </div>
            <div class="col-md-6">
              <label class="form-label">Image</label>
              <input type="file" class="form-control" id="productImage" accept="image/*" required>
            </div>
            <div class="col-12">
              <label class="form-label">Description</label>
              <textarea class="form-control" id="productDesc" rows="2"></textarea>
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
    <div class="card-body table-responsive">
      <table class="table table-bordered table-hover align-middle">
        <thead class="table-secondary text-center">
          <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Price</th>
            <th>Category</th>
            <th>Description</th>
            <th>Remove</th>
          </tr>
        </thead>
        <tbody id="productTable" class="table-group-divider">
          <!-- Products will appear here -->
        </tbody>
      </table>
    </div>
  </div>
</div>

<script>
  // Tab Switching
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

  const productForm = document.getElementById("productForm");
  const productTable = document.getElementById("productTable");

  // Add single product
  productForm.addEventListener("submit", function(e) {
    e.preventDefault();
    const name = document.getElementById("productName").value;
    const price = document.getElementById("productPrice").value;
    const category = document.getElementById("productCategory").value;
    const desc = document.getElementById("productDesc").value;
    const imageFile = document.getElementById("productImage").files[0];
    let imageURL = imageFile ? URL.createObjectURL(imageFile) : "";

    addProductToTable(imageURL, name, price, category, desc);
    productForm.reset();
  });

  // Add product row
  function addProductToTable(image, name, price, category, desc) {
    const row = document.createElement("tr");
    row.innerHTML = `
      <td><img src="${image}" class="product-img"></td>
      <td class="text-start fw-semibold">${name}</td>
      <td class="text-center">₹${price}</td>
      <td class="text-start">${category}</td>
      <td class="text-start">${desc}</td>
      <td class="text-center"><button class="btn btn-sm btn-danger remove-btn">X</button></td>
    `;
    row.querySelector(".remove-btn").addEventListener("click", () => row.remove());
    productTable.appendChild(row);
  }

  // CSV Upload
  document.getElementById("uploadCSV").addEventListener("click", function() {
    const file = document.getElementById("csvFile").files[0];
    if (!file) {
      alert("Please select a CSV file");
      return;
    }
    const reader = new FileReader();
    reader.onload = function(e) {
      const rows = e.target.result.split("\n").slice(1); // skip header
      rows.forEach(line => {
        const [name, price, category, desc] = line.split(",");
        if (name && price && category) {
          addProductToTable("", name.trim(), price.trim(), category.trim(), desc ? desc.trim() : "");
        }
      });
    };
    reader.readAsText(file);
  });
</script>
</body>
</html>
