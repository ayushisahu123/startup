<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Product Details</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f8f9fa; }
    .product-img { max-width: 300px; border-radius: 10px; }
    .card { border-radius: 12px; }
  </style>
</head>
<body>
<div class="container py-4">
  <h2 class="text-center mb-4">📦 Product Details</h2>

  <div class="row g-4">
    <!-- Product Image -->
    <div class="col-md-4 text-center">
      <img src="images/ChatGPT Image Aug 21, 2025, 08_44_37 PM.png" alt="Product" class="product-img img-fluid shadow" id="detailImage">
      <div class="mt-3">
        <label class="form-label">Change Image</label>
        <input type="file" class="form-control" id="editImage" accept="image/*">
      </div>
    </div>

    <!-- Product Details -->
    <div class="col-md-8">
      <div class="card shadow">
        <div class="card-body">
          <form id="editProductForm">
            <div class="mb-3">
              <label class="form-label">Product Name</label>
              <input type="text" class="form-control" id="editName" value="Sample Product" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Price</label>
              <input type="number" class="form-control" id="editPrice" value="999" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Category</label>
              <select class="form-select" id="editCategory" required>
                <option>Electronics</option>
                <option>Clothing</option>
                <option>Books</option>
                <option>Home Appliances</option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">Description</label>
              <textarea class="form-control" id="editDesc" rows="3">This is a sample product description.</textarea>
            </div>
            <button type="submit" class="btn btn-primary">💾 Save Changes</button>
            <button type="button" class="btn btn-danger" id="deleteBtn">🗑️ Delete Product</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  const productImage = document.getElementById("detailImage");
  const editImageInput = document.getElementById("editImage");
  const editProductForm = document.getElementById("editProductForm");
  const deleteBtn = document.getElementById("deleteBtn");

  // Preview new image
  editImageInput.addEventListener("change", function() {
    const file = this.files[0];
    if (file) {
      productImage.src = URL.createObjectURL(file);
    }
  });

  // Save changes
  editProductForm.addEventListener("submit", function(e) {
    e.preventDefault();
    const updatedProduct = {
      name: document.getElementById("editName").value,
      price: document.getElementById("editPrice").value,
      category: document.getElementById("editCategory").value,
      desc: document.getElementById("editDesc").value
    };
    alert("✅ Product updated!\n\n" + JSON.stringify(updatedProduct, null, 2));
  });

  // Delete product
  deleteBtn.addEventListener("click", function() {
    if (confirm("Are you sure you want to delete this product?")) {
      alert("🗑️ Product deleted!");
      // redirect to product list page (example)
      window.location.href = "myProducts.html";
    }
  });
</script>
</body>
</html>
