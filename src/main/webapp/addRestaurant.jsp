<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Add Restaurant</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="adminDashboard.jsp" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Dashboard</a>
      <a href="viewRestaurants" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">View All</a>
      <a href="logout" class="nav-pill-logout ms-2">Logout</a>
    </div>
  </div>
</nav>

<div class="admin-form-wrap">
  <div class="admin-form-card">
    <div class="admin-form-header">
      <div class="header-icon">🏪</div>
      <h3>Add New Restaurant</h3>
      <p>Fill in details to list a restaurant on FoodieApp</p>
    </div>

    <div class="admin-form-body">
      <%
      String success = (String) request.getAttribute("success");
      String error = (String) request.getAttribute("error");

      if (success != null) {
      %>
      <div class="admin-success-msg">
        ✅ <%= success %>
      </div>
      <%
      }

      if (error != null) {
      %>
      <div class="admin-error-msg">
        ⚠️ <%= error %>
      </div>
      <%
      }
      %>

      <form action="addRestaurant" method="post">

        <div class="mb-3">
          <label class="form-label">Restaurant Name</label>
          <input type="text" name="restaurantName" class="form-control" placeholder="e.g. Empire Restaurant" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Address</label>
          <input type="text" name="address" class="form-control" placeholder="Full address" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Cuisine Type</label>
          <input type="text" name="cuisineType" class="form-control" placeholder="e.g. North Indian, Chinese" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Rating (0.0 – 5.0)</label>
          <input type="number" step="0.1" min="0" max="5" name="rating" class="form-control" placeholder="4.5" required>
        </div>

        <div class="mb-4">
          <label class="form-label">Image Filename</label>
          <input type="text" name="imagePath" class="form-control" placeholder="empire.jpg">
          <small>Place image in images/restaurants/ folder</small>
        </div>

        <div class="d-flex gap-2">
          <button type="submit" class="admin-btn-submit flex-grow-1">
            + Add Restaurant
          </button>
          <a href="viewRestaurants" class="admin-btn-secondary d-flex align-items-center justify-content-center">
            Cancel
          </a>
        </div>

      </form>
    </div>
  </div>
</div>

</body>
</html>