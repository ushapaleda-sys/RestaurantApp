<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.restaurant.model.User" %>
<% User user=(User)session.getAttribute("loggedInUser"); if(user==null){response.sendRedirect("login.jsp");return;} %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>Order Confirmed — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f2f2f7;font-family:'Inter',sans-serif;min-height:100vh;display:flex;flex-direction:column;}
  .confirm-wrap{flex:1;display:flex;align-items:center;justify-content:center;padding:50px 15px;}
  .confirm-card{background:#fff;border:1px solid #e5e5ea;border-radius:18px;overflow:hidden;max-width:580px;width:100%;box-shadow:0 4px 24px rgba(0,0,0,0.08);}
  .confirm-header{background:linear-gradient(135deg,#27ae60,#2ecc71);padding:44px 30px;text-align:center;}
  .check-ring{width:76px;height:76px;border-radius:50%;background:rgba(255,255,255,0.25);border:2px solid rgba(255,255,255,0.5);display:flex;align-items:center;justify-content:center;margin:0 auto 18px;font-size:2rem;}
  .confirm-header h2{color:#fff;font-weight:800;font-size:1.7rem;}
  .confirm-header p{color:rgba(255,255,255,0.85);font-size:0.9rem;margin-top:5px;}
  .confirm-body{padding:36px;}
  .info-box{background:#f9f9fb;border:1px solid #e5e5ea;border-radius:12px;padding:20px;}
  .info-row{display:flex;justify-content:space-between;align-items:center;padding:10px 0;}
  .info-row:not(:last-child){border-bottom:1px solid #f0f0f0;}
  .i-key{color:#6e6e73;font-size:0.82rem;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;}
  .i-val{color:#1c1c1e;font-weight:600;}
  .i-amt{color:#e23744;font-weight:800;font-size:1.2rem;}
  .i-status{color:#27ae60;font-weight:700;}
  .eta-box{background:#f0fdf4;border:1px solid #a5d6a7;border-radius:10px;padding:13px 16px;margin-top:18px;font-size:0.86rem;color:#2e7d32;}
</style>
</head><body>
<nav class="navbar navbar-expand-lg" style="background:#fff;border-bottom:2px solid transparent;border-image:linear-gradient(90deg,#f953c6,#4776e6,#38ef7d) 1;box-shadow:0 2px 16px rgba(0,0,0,0.07);padding:10px 0;position:sticky;top:0;z-index:1050;">
  <div class="container">
    <a class="navbar-brand" href="home.jsp" style="font-family:Poppins,sans-serif;font-size:1.45rem;font-weight:900;color:#fc8019;">🍽 FoodieApp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nb"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="nb">
      <div class="ms-auto d-flex gap-2 flex-wrap align-items-center">
        <a href="home.jsp"    class="nav-pill-outline">Home</a>
        <a href="restaurants" class="nav-pill-outline">Restaurants</a>
        <a href="cart.jsp"    class="nav-pill-active">Cart</a>
        <a href="orders"      class="nav-pill-active">Orders</a>
        <a href="profile.jsp" class="nav-pill-active">Profile</a>
        <a href="logout"      class="nav-pill-outline" style="color:#f953c6;border-color:rgba(249,83,198,0.4);">Logout</a>
      </div>
    </div>
  </div>
</nav>
<div class="confirm-wrap">
  <div class="confirm-card">
    <div class="confirm-header">
      <div class="check-ring">✅</div>
      <h2>Order Confirmed!</h2>
      <p>Thank you, <strong><%= user.getName() %></strong> — your food is being prepared 🍽</p>
    </div>
    <div class="confirm-body">
      <div class="info-box">
        <div class="info-row"><span class="i-key">Order ID</span><span class="i-val">#<%= request.getAttribute("orderId") %></span></div>
        <div class="info-row"><span class="i-key">Total Paid</span><span class="i-amt">₹<%= request.getAttribute("totalAmount") %></span></div>
        <div class="info-row"><span class="i-key">Status</span><span class="i-status">● Confirmed</span></div>
      </div>
      <div class="eta-box">⏱ Estimated delivery: <strong>25–35 minutes</strong>. We'll keep you posted!</div>
      <div class="d-flex flex-wrap gap-3 justify-content-center mt-4">
        <a href="restaurants" class="btn btn-danger">Order More</a>
        <a href="orders"      class="btn btn-info">View Orders</a>
        <a href="home.jsp"    class="btn btn-outline-light">Home</a>
      </div>
    </div>
  </div>
</div>
</body></html>
