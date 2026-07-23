<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Menu Item — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Add Menu Item</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="viewMenus" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Manage Menu</a>
    </div>
  </div>
</nav>

<div class="admin-form-wrap">
  <div class="admin-form-card">
    <div class="admin-form-header">
      <div class="header-icon">🍔</div>
      <h3>Add New Menu Item</h3>
      <p>Fill in details to add a food item to a restaurant menu</p>
    </div>

    <div class="admin-form-body">
      <form action="addMenu" method="post">

        <div class="mb-3">
          <label class="form-label">Menu Item Name</label>
          <input type="text" name="name" class="form-control" placeholder="e.g. Chicken Biryani" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Description</label>
          <input type="text" name="description" class="form-control" placeholder="Short description of the dish" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Price (₹)</label>
          <input type="number" step="0.01" name="price" class="form-control" placeholder="250.00" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Restaurant ID</label>
          <input type="number" name="restaurantId" class="form-control" placeholder="e.g. 1" required>
        </div>

        <div class="mb-4">
          <label class="form-label">Image Filename</label>
          <input type="text" name="imagePath" class="form-control" placeholder="biryani.jpg" required>
          <small>Place image inside images/menu/ directory</small>
        </div>

        <div class="d-flex gap-2">
          <button type="submit" class="admin-btn-submit flex-grow-1">
            + Add Menu Item
          </button>
          <a href="viewMenus" class="admin-btn-secondary d-flex align-items-center justify-content-center">
            Cancel
          </a>
        </div>

      </form>
    </div>
  </div>
</div>

</body>
</html>