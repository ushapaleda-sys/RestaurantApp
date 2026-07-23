<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.restaurant.model.Menu"%>

<%
Menu menu = (Menu) request.getAttribute("menu");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Menu — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Edit Menu Item</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="viewMenus" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Manage Menu</a>
    </div>
  </div>
</nav>

<div class="admin-form-wrap">
  <div class="admin-form-card">
    <div class="admin-form-header">
      <div class="header-icon">📝</div>
      <h3>Edit Menu Item</h3>
      <p>Modify menu details for Item #<%= menu != null ? menu.getMenuId() : "" %></p>
    </div>

    <div class="admin-form-body">
      <form action="updateMenu" method="post">

        <input type="hidden" name="menuId" value="<%= menu != null ? menu.getMenuId() : "" %>">

        <div class="mb-3">
          <label class="form-label">Menu Item Name</label>
          <input type="text" name="name" value="<%= menu != null ? menu.getName() : "" %>" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Description</label>
          <input type="text" name="description" value="<%= menu != null ? menu.getDescription() : "" %>" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Price (₹)</label>
          <input type="number" step="0.01" name="price" value="<%= menu != null ? menu.getPrice() : "" %>" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Restaurant ID</label>
          <input type="number" name="restaurantId" value="<%= menu != null ? menu.getRestaurantId() : "" %>" class="form-control" required>
        </div>

        <div class="mb-4">
          <label class="form-label">Image Filename</label>
          <input type="text" name="imagePath" value="<%= menu != null ? menu.getImagePath() : "" %>" class="form-control" required>
          <small>Place image inside images/menu/ directory</small>
        </div>

        <div class="d-flex gap-2">
          <button type="submit" class="admin-btn-submit flex-grow-1">
            Update Menu Item
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