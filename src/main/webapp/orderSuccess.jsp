<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.restaurant.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Order Success — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f5f5f5;font-family:'Inter',sans-serif;min-height:100vh;display:flex;flex-direction:column;}
  .success-wrap{flex:1;display:flex;align-items:center;justify-content:center;padding:50px 15px;}
  .success-card{background:#fff;border:1px solid #e9e9eb;border-radius:18px;overflow:hidden;max-width:560px;width:100%;box-shadow:0 4px 24px rgba(0,0,0,0.08);}
  .success-header{background:linear-gradient(135deg,#fc8019,#ffc107);padding:44px 30px;text-align:center;}
  .check-ring{width:80px;height:80px;border-radius:50%;background:rgba(255,255,255,0.25);border:2px solid rgba(255,255,255,0.5);display:flex;align-items:center;justify-content:center;margin:0 auto 18px;font-size:2.2rem;}
  .success-header h2{color:#fff;font-weight:800;font-size:1.8rem;}
  .success-header p{color:rgba(255,255,255,0.88);font-size:0.9rem;margin-top:6px;}
  .success-body{padding:36px;}
  .eta-box{background:#fff8f1;border:1px solid #ffd5a8;border-radius:10px;padding:13px 16px;margin-top:18px;font-size:0.86rem;color:#c85f00;}
  .btn-orange{background:#fc8019;color:#fff;border:none;font-weight:700;padding:10px 24px;border-radius:8px;text-decoration:none;display:inline-block;transition:0.2s;}
  .btn-orange:hover{background:#e16f0e;color:#fff;}
  .btn-outline2{background:#fff;color:#888;border:1px solid #e9e9eb;font-weight:600;padding:10px 24px;border-radius:8px;text-decoration:none;display:inline-block;transition:0.2s;}
  .btn-outline2:hover{border-color:#fc8019;color:#fc8019;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background:#fff;border-bottom:1px solid #e9e9eb;box-shadow:0 1px 8px rgba(0,0,0,0.06);padding:10px 0;position:sticky;top:0;z-index:1050;">
  <div class="container">
    <a class="navbar-brand" href="home.jsp" style="font-size:1.45rem;font-weight:900;color:#fc8019;">🍽 FoodieApp</a>
    <div class="ms-auto d-flex gap-2 flex-wrap align-items-center">
      <a href="home.jsp"    class="nav-pill-outline">Home</a>
      <a href="restaurants" class="nav-pill-outline">Restaurants</a>
      <a href="cart.jsp"    class="nav-pill-active">Cart</a>
      <a href="orders"      class="nav-pill-active">Orders</a>
      <a href="profile.jsp" class="nav-pill-active">Profile</a>
      <a href="logout"      class="nav-pill-outline">Logout</a>
    </div>
  </div>
</nav>
<div class="success-wrap">
  <div class="success-card">
    <div class="success-header">
      <div class="check-ring">✅</div>
      <h2>Order Placed Successfully!</h2>
      <p>Thank you, <strong><%= user.getName() %></strong> — your food is on its way! 🍽</p>
    </div>
    <div class="success-body">
      <div class="eta-box">⏱ Estimated delivery time: <strong>25–35 minutes</strong>. We'll notify you when it's on the way!</div>
      <div class="d-flex flex-wrap gap-3 justify-content-center mt-4">
        <a href="restaurants" class="btn-orange">Order More</a>
        <a href="orders"      class="btn-orange">View My Orders</a>
        <a href="home.jsp"    class="btn-outline2">Go to Home</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
