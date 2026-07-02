<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.Restaurant" %>
<%@ page import="com.restaurant.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Restaurants — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f5f5f5;font-family:'Inter',sans-serif;}
  .page-hero{background:#fff;border-bottom:1px solid #e9e9eb;padding:36px 0 28px;}
  .page-hero h1{font-weight:800;font-size:1.9rem;color:#1c1c1e;}
  .page-hero p{color:#888;font-size:0.9rem;margin-top:4px;}
  .red-label{font-size:0.7rem;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:#fc8019;margin-bottom:8px;}
  .r-card{background:#fff;border:1px solid #e9e9eb;border-radius:14px;overflow:hidden;transition:0.22s;box-shadow:0 2px 12px rgba(0,0,0,0.06);}
  .r-card:hover{transform:translateY(-5px);box-shadow:0 8px 28px rgba(0,0,0,0.12);border-color:#fc8019;}
  .r-img{width:100%;height:200px;object-fit:cover;}
  .r-body{padding:18px;}
  .r-body h3{font-weight:700;font-size:1.05rem;color:#1c1c1e;margin-bottom:5px;}
  .r-meta{font-size:0.82rem;color:#888;margin-bottom:3px;}
  .r-rating{display:inline-flex;align-items:center;gap:4px;background:#e8f5e9;border:1px solid #a5d6a7;color:#2e7d32;font-size:0.8rem;font-weight:700;padding:3px 10px;border-radius:20px;margin:8px 0 14px;}
  .btn-view{display:block;background:#fc8019;color:#fff;text-align:center;padding:10px;border-radius:8px;font-weight:600;font-size:0.88rem;text-decoration:none;transition:0.2s;}
  .btn-view:hover{background:#e16f0e;color:#fff;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background:#fff;border-bottom:1px solid #e9e9eb;box-shadow:0 1px 8px rgba(0,0,0,0.06);padding:10px 0;position:sticky;top:0;z-index:1050;">
  <div class="container">
    <a class="navbar-brand" href="home.jsp" style="font-size:1.45rem;font-weight:900;color:#fc8019;">🍽 FoodieApp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nb"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="nb">
      <div class="ms-auto d-flex gap-2 flex-wrap align-items-center">
        <a href="home.jsp"    class="nav-pill-outline">Home</a>
        <a href="restaurants" class="nav-pill-outline">Restaurants</a>
        <a href="cart.jsp"    class="nav-pill-active">Cart</a>
        <a href="orders"      class="nav-pill-active">Orders</a>
        <a href="profile.jsp" class="nav-pill-active">Profile</a>
        <a href="logout"      class="nav-pill-outline">Logout</a>
      </div>
    </div>
  </div>
</nav>
<div class="page-hero">
  <div class="container">
    <div class="red-label">✦ Explore</div>
    <h1>Available Restaurants</h1>
    <p>Welcome, <%= user.getName() %> — find your perfect meal</p>
  </div>
</div>
<div class="container py-4">
  <div class="row g-4">
    <%
      List<Restaurant> list = (List<Restaurant>) request.getAttribute("restaurantList");
      if(list != null && !list.isEmpty()){
        for(Restaurant r : list){
          String img = r.getImagePath();
          if(img == null || img.trim().isEmpty()) img = "default.jpg";
    %>
    <div class="col-md-6 col-lg-4">
      <div class="r-card h-100">
        <img src="images/restaurants/<%= img %>" class="r-img" alt="<%= r.getName() %>">
        <div class="r-body">
          <h3><%= r.getName() %></h3>
          <p class="r-meta">📍 <%= r.getAddress() %></p>
          <p class="r-meta">🍴 <%= r.getCuisineType() %></p>
          <div class="r-rating">⭐ <%= r.getRating() %></div>
          <a href="menu?restaurantId=<%= r.getRestaurantId() %>" class="btn-view">View Menu</a>
        </div>
      </div>
    </div>
    <% }} else { %>
    <div class="col-12"><div class="alert alert-warning text-center">No restaurants found.</div></div>
    <% } %>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
