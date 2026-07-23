<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Restaurants — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Manage Restaurants</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="adminDashboard.jsp" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Dashboard</a>
      <a href="addRestaurant.jsp" class="admin-btn-primary py-1 px-3" style="font-size: 0.82rem;">+ Add Restaurant</a>
      <a href="logout" class="nav-pill-logout ms-2">Logout</a>
    </div>
  </div>
</nav>

<div class="container py-4">

  <div class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <h3 class="fw-bold m-0" style="color: var(--admin-text);">Restaurant Directory</h3>
      <p class="text-muted m-0" style="font-size: 0.88rem;">View, edit, or delete existing restaurants</p>
    </div>
  </div>

  <div class="admin-table-container">
    <div class="table-responsive">
      <table class="table admin-table align-middle">
        <thead>
          <tr>
            <th>ID</th>
            <th>Restaurant Name</th>
            <th>Address</th>
            <th>Cuisine</th>
            <th>Rating</th>
            <th>Preview</th>
            <th class="text-end">Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
          List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
          if(restaurants != null && !restaurants.isEmpty()){
              for(Restaurant r : restaurants){
          %>
          <tr>
            <td class="fw-bold" style="color: var(--admin-primary);">#<%=r.getRestaurantId()%></td>
            <td class="fw-bold" style="color: var(--admin-text);"><%=r.getName()%></td>
            <td style="color: var(--admin-text-mid);"><%=r.getAddress()%></td>
            <td><span class="badge bg-light text-dark border px-2 py-1"><%=r.getCuisineType()%></span></td>
            <td><span class="admin-status-badge active">★ <%=r.getRating()%></span></td>
            <td>
              <img src="images/restaurants/<%=r.getImagePath()%>" alt="<%=r.getName()%>" style="width:55px; height:42px; object-fit:cover; border-radius:8px; border:1px solid #e0e0e0;">
            </td>
            <td class="text-end">
              <a href="editRestaurant?id=<%=r.getRestaurantId()%>" class="admin-btn-secondary py-1 px-3 me-1" style="font-size:0.8rem;">Edit</a>
              <a href="deleteRestaurant?id=<%=r.getRestaurantId()%>" onclick="return confirm('Delete Restaurant?')" class="admin-btn-danger py-1 px-3">Delete</a>
            </td>
          </tr>
          <%
              }
          } else {
          %>
          <tr>
            <td colspan="7" class="text-center py-4 text-muted">No Restaurants Found</td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>

</div>

</body>
</html>