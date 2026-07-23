<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.restaurant.model.Menu"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Menu — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Manage Menu</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="adminDashboard.jsp" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Dashboard</a>
      <a href="addMenu.jsp" class="admin-btn-primary py-1 px-3" style="font-size: 0.82rem;">+ Add Menu Item</a>
      <a href="logout" class="nav-pill-logout ms-2">Logout</a>
    </div>
  </div>
</nav>

<div class="container py-4">

  <div class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <h3 class="fw-bold m-0" style="color: var(--admin-text);">Menu Catalog</h3>
      <p class="text-muted m-0" style="font-size: 0.88rem;">View, edit, or delete food items across restaurants</p>
    </div>
  </div>

  <div class="admin-table-container">
    <div class="table-responsive">
      <table class="table admin-table align-middle">
        <thead>
          <tr>
            <th>ID</th>
            <th>Item Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Restaurant ID</th>
            <th>Preview</th>
            <th class="text-end">Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
          List<Menu> menus = (List<Menu>) request.getAttribute("menus");
          if(menus != null && !menus.isEmpty()){
              for(Menu m : menus){
          %>
          <tr>
            <td class="fw-bold" style="color: var(--admin-primary);">#<%=m.getMenuId()%></td>
            <td class="fw-bold" style="color: var(--admin-text);"><%=m.getName()%></td>
            <td style="color: var(--admin-text-mid); max-width: 250px;"><%=m.getDescription()%></td>
            <td class="fw-bold" style="color: var(--admin-accent);">₹ <%=m.getPrice()%></td>
            <td><span class="badge bg-light text-dark border px-2 py-1">Rest ID: #<%=m.getRestaurantId()%></span></td>
            <td>
              <img src="images/menu/<%=m.getImagePath()%>" alt="<%=m.getName()%>" style="width:50px; height:50px; object-fit:cover; border-radius:10px; border:1px solid #e0e0e0;">
            </td>
            <td class="text-end">
              <a href="editMenu?id=<%=m.getMenuId()%>" class="admin-btn-secondary py-1 px-3 me-1" style="font-size:0.8rem;">Edit</a>
              <a href="deleteMenu?id=<%=m.getMenuId()%>" onclick="return confirm('Delete Menu Item?')" class="admin-btn-danger py-1 px-3">Delete</a>
            </td>
          </tr>
          <%
              }
          } else {
          %>
          <tr>
            <td colspan="7" class="text-center py-4 text-muted">No Menu Items Found</td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>

</div>

</body>
</html>