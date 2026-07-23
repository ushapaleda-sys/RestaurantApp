<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.restaurant.model.Restaurant"%>

<%
Restaurant r = (Restaurant) request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Restaurant — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Edit Restaurant</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="viewRestaurants" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Back to List</a>
    </div>
  </div>
</nav>

<div class="admin-form-wrap">
  <div class="admin-form-card">
    <div class="admin-form-header">
      <div class="header-icon">✏️</div>
      <h3>Edit Restaurant</h3>
      <p>Modify restaurant details for #<%= r != null ? r.getRestaurantId() : "" %></p>
    </div>

    <div class="admin-form-body">
      <form action="updateRestaurant" method="post">

        <input type="hidden" name="restaurantId" value="<%= r != null ? r.getRestaurantId() : "" %>">

        <div class="mb-3">
          <label class="form-label">Restaurant Name</label>
          <input type="text" name="restaurantName" value="<%= r != null ? r.getName() : "" %>" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Address</label>
          <input type="text" name="address" value="<%= r != null ? r.getAddress() : "" %>" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Cuisine Type</label>
          <input type="text" name="cuisineType" value="<%= r != null ? r.getCuisineType() : "" %>" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Rating (0.0 – 5.0)</label>
          <input type="number" step="0.1" name="rating" value="<%= r != null ? r.getRating() : "" %>" class="form-control" required>
        </div>

        <div class="mb-4">
          <label class="form-label">Image Filename</label>
          <input type="text" name="imagePath" value="<%= r != null ? r.getImagePath() : "" %>" class="form-control">
          <small>Place image in images/restaurants/ directory</small>
        </div>

        <div class="d-flex gap-2">
          <button type="submit" class="admin-btn-submit flex-grow-1">
            Update Restaurant
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