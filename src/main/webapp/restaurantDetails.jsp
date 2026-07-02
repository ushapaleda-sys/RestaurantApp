<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.model.Restaurant"%>
<%
  Restaurant r = (Restaurant) request.getAttribute("restaurant");
  if(r == null){ response.sendRedirect("restaurants"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title><%= r.getName() %> — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f5f5f5;font-family:'Inter',sans-serif;}
  .hero-img-wrap{position:relative;height:360px;overflow:hidden;}
  .hero-img-wrap img{width:100%;height:100%;object-fit:cover;}
  .hero-img-wrap .overlay{position:absolute;inset:0;background:linear-gradient(to top,rgba(0,0,0,0.65) 0%,transparent 55%);}
  .hero-title{position:absolute;bottom:24px;left:32px;color:#fff;font-weight:800;font-size:2rem;}
  .rating-pill{display:inline-flex;align-items:center;gap:5px;background:#e8f5e9;border:1px solid #a5d6a7;color:#2e7d32;font-weight:700;font-size:0.88rem;padding:5px 14px;border-radius:20px;}
  .info-card{background:#fff;border:1px solid #e9e9eb;border-radius:14px;padding:28px;margin-top:24px;box-shadow:0 2px 12px rgba(0,0,0,0.06);}
  .info-row{display:flex;gap:12px;margin-bottom:16px;align-items:flex-start;}
  .info-lbl{font-size:0.72rem;font-weight:700;letter-spacing:1.5px;text-transform:uppercase;color:#fc8019;margin-bottom:2px;}
  .info-val{color:#3a3a3c;font-size:0.92rem;}
  .btn-orange{background:#fc8019;color:#fff;border:none;font-weight:700;padding:11px 28px;border-radius:8px;text-decoration:none;display:inline-block;transition:0.2s;}
  .btn-orange:hover{background:#e16f0e;color:#fff;}
  .btn-back{background:#fff;color:#888;border:1px solid #e9e9eb;font-weight:600;padding:11px 24px;border-radius:8px;text-decoration:none;display:inline-block;transition:0.2s;}
  .btn-back:hover{border-color:#fc8019;color:#fc8019;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background:#fff;border-bottom:1px solid #e9e9eb;box-shadow:0 1px 8px rgba(0,0,0,0.06);padding:10px 0;position:sticky;top:0;z-index:1050;">
  <div class="container">
    <a class="navbar-brand" href="home.jsp" style="font-size:1.45rem;font-weight:900;color:#fc8019;">🍽 FoodieApp</a>
    <div class="ms-auto d-flex gap-2">
      <a href="restaurants" class="nav-pill-outline">← Restaurants</a>
      <a href="cart.jsp"    class="nav-pill-active">Cart</a>
      <a href="orders"      class="nav-pill-active">Orders</a>
    </div>
  </div>
</nav>
<div class="hero-img-wrap">
  <img src="images/restaurants/<%= r.getImagePath() != null ? r.getImagePath() : "default.jpg" %>" alt="<%= r.getName() %>">
  <div class="overlay"></div>
  <div class="hero-title"><%= r.getName() %></div>
</div>
<div class="container">
  <div class="info-card">
    <div class="row g-4 mb-3">
      <div class="col-md-4">
        <div class="info-row">
          <div>
            <div class="info-lbl">Address</div>
            <div class="info-val"><%= r.getAddress() %></div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="info-row">
          <div>
            <div class="info-lbl">Cuisine</div>
            <div class="info-val"><%= r.getCuisineType() %></div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="info-row">
          <div>
            <div class="info-lbl">Rating</div>
            <div><span class="rating-pill">⭐ <%= r.getRating() %> / 5.0</span></div>
          </div>
        </div>
      </div>
    </div>
    <div class="d-flex gap-3 flex-wrap">
      <a href="menu?restaurantId=<%= r.getRestaurantId() %>" class="btn-orange">View Menu</a>
      <a href="restaurants" class="btn-back">← Back</a>
    </div>
  </div>
</div>
</body>
</html>
