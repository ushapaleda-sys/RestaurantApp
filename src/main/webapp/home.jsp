<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Poppins:wght@700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  .top-nav {
    position:absolute;top:0;left:0;right:0;z-index:100;
    padding:18px 40px;display:flex;align-items:center;justify-content:space-between;
    background:linear-gradient(to bottom,rgba(0,0,0,0.45),transparent);
  }
  .top-nav .brand{font-family:'Poppins',sans-serif;font-size:1.6rem;font-weight:900;color:#fff;text-decoration:none;}
  .top-nav .nav-links{display:flex;gap:10px;flex-wrap:wrap;align-items:center;}
  .video-hero{position:relative;width:100%;height:100vh;overflow:hidden;display:flex;align-items:center;justify-content:center;}
  .hero-video{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;z-index:0;}
  .hero-overlay{position:absolute;inset:0;z-index:1;background:radial-gradient(ellipse at 65% 55%,rgba(160,50,20,0.4) 0%,transparent 55%),linear-gradient(to bottom,rgba(0,0,0,0.35) 0%,rgba(0,0,0,0.6) 100%);}
  .hero-text{position:relative;z-index:2;text-align:center;padding:20px;}
  .hero-text .app-name{font-family:'Poppins',sans-serif;font-size:clamp(3rem,8vw,6rem);font-weight:900;color:#fff;letter-spacing:-2px;line-height:1;margin-bottom:16px;}
  .hero-text .tagline{font-size:clamp(1.4rem,3.5vw,2.4rem);font-weight:800;color:#fff;line-height:1.2;margin-bottom:12px;}
  .hero-text .sub{font-size:1.05rem;color:rgba(255,255,255,0.82);max-width:480px;margin:0 auto 40px;}
  .btn-hero{background:#fc8019;color:#fff;border:none;font-weight:700;font-size:1rem;padding:14px 34px;border-radius:25px;text-decoration:none;display:inline-block;transition:0.22s;}
  .btn-hero:hover{background:#e16f0e;color:#fff;}
  .btn-hero-ghost{background:rgba(255,255,255,0.14);border:1.5px solid rgba(255,255,255,0.45);color:#fff;font-weight:600;font-size:1rem;padding:14px 34px;border-radius:25px;text-decoration:none;display:inline-block;transition:0.22s;}
  .btn-hero-ghost:hover{background:rgba(255,255,255,0.25);color:#fff;}
  .scroll-hint{position:absolute;bottom:28px;left:50%;transform:translateX(-50%);z-index:2;text-align:center;color:rgba(255,255,255,0.6);font-size:0.8rem;font-weight:600;}
  .scroll-hint span{display:block;animation:bob 1.8s infinite;font-size:1.1rem;margin-top:4px;}
  @keyframes bob{0%,100%{transform:translateY(0)}50%{transform:translateY(7px)}}
  .below-hero{background:#f5f5f5;padding:64px 0;}
  .stats-strip{background:#fff;border-radius:16px;padding:32px 24px;display:flex;justify-content:space-around;flex-wrap:wrap;gap:20px;margin-bottom:56px;box-shadow:0 4px 20px rgba(0,0,0,0.07);border:1px solid #e9e9eb;}
  .stat-box{text-align:center;}
  .stat-num{font-family:'Poppins',sans-serif;font-size:2rem;font-weight:900;color:#fc8019;}
  .stat-lbl{font-size:0.72rem;font-weight:700;letter-spacing:1.5px;text-transform:uppercase;color:#aaa;margin-top:3px;}
  .sec-label{font-size:0.7rem;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:#fc8019;margin-bottom:8px;}
  .sec-title{font-family:'Poppins',sans-serif;font-size:1.8rem;font-weight:800;color:#1a1a2e;margin-bottom:32px;}
  .feat-card{background:#fff;border:1px solid #e8e8f0;border-radius:16px;padding:28px 22px;height:100%;transition:0.22s;box-shadow:0 4px 20px rgba(0,0,0,0.07);}
  .feat-card:hover{transform:translateY(-5px);box-shadow:0 12px 40px rgba(0,0,0,0.12);}
  .feat-icon{font-size:2rem;margin-bottom:12px;}
  .feat-card h5{color:#1a1a2e;font-weight:700;font-size:1rem;margin-bottom:6px;}
  .feat-card p{color:#888899;font-size:0.86rem;margin-bottom:18px;}
  .feat-btn{display:block;width:100%;padding:11px 16px;border-radius:10px;border:none;font-size:0.88rem;font-weight:700;text-align:center;text-decoration:none;cursor:pointer;transition:0.22s;background:#fc8019;color:#fff !important;}
  .feat-btn:hover{background:#e16f0e;color:#fff !important;}
</style>
</head>
<body style="margin:0;font-family:'Inter',sans-serif;background:#f5f5f5;">

<nav class="top-nav">
  <a href="home.jsp" class="brand">🍽 FoodieApp</a>
  <div class="nav-links">
    <a href="home.jsp"    class="nav-pill-outline" style="color:#fff;border-color:rgba(255,255,255,0.35);">Home</a>
    <a href="restaurants" class="nav-pill-outline" style="color:#fff;border-color:rgba(255,255,255,0.35);">Restaurants</a>
    <a href="cart.jsp"    class="nav-pill-active">Cart</a>
    <a href="orders"      class="nav-pill-active">Orders</a>
    <a href="profile.jsp" class="nav-pill-active">Profile</a>
    <a href="logout"      class="nav-pill-outline" style="color:#ffaaaa;border-color:rgba(252,128,25,0.5);">Logout</a>
  </div>
</nav>

<section class="video-hero">
  <video class="hero-video" autoplay muted loop playsinline poster="images/banner/banner.jpg">
    <source src="images/banner/banner.mp4" type="video/mp4">
  </video>
  <div class="hero-overlay"></div>
  <div class="hero-text">
    <div class="app-name">FoodieApp</div>
    <div class="tagline">Bengaluru's #1<br>food delivery app</div>
    <p class="sub">Welcome back, <strong><%= user.getName() %></strong> — fast &amp; easy ordering from top restaurants.</p>
    <div class="d-flex gap-3 justify-content-center flex-wrap">
      <a href="restaurants" class="btn-hero">Order Now</a>
      <a href="orders"      class="btn-hero-ghost">My Orders</a>
    </div>
  </div>
  <div class="scroll-hint">Scroll down<span>⌄</span></div>
</section>

<div class="below-hero">
  <div class="container">
    <div class="stats-strip">
      <div class="stat-box"><div class="stat-num">50+</div><div class="stat-lbl">Restaurants</div></div>
      <div class="stat-box"><div class="stat-num">200+</div><div class="stat-lbl">Menu Items</div></div>
      <div class="stat-box"><div class="stat-num">30 min</div><div class="stat-lbl">Avg Delivery</div></div>
      <div class="stat-box"><div class="stat-num">4.8 ★</div><div class="stat-lbl">Avg Rating</div></div>
    </div>
    <div class="sec-label">Everything you need</div>
    <div class="sec-title">Why choose FoodieApp?</div>
    <div class="row g-4">
      <div class="col-md-3 col-sm-6"><div class="feat-card"><div class="feat-icon">🍽</div><h5>Restaurants</h5><p>Browse top-rated restaurants and diverse cuisines near you.</p><a href="restaurants" class="feat-btn">Browse</a></div></div>
      <div class="col-md-3 col-sm-6"><div class="feat-card"><div class="feat-icon">🛒</div><h5>Your Cart</h5><p>Add items and manage your order with ease.</p><a href="cart.jsp" class="feat-btn">View Cart</a></div></div>
      <div class="col-md-3 col-sm-6"><div class="feat-card"><div class="feat-icon">📦</div><h5>Order History</h5><p>Track your current and past orders any time.</p><a href="orders" class="feat-btn">My Orders</a></div></div>
      <div class="col-md-3 col-sm-6"><div class="feat-card"><div class="feat-icon">👤</div><h5>Your Profile</h5><p>View and manage your account details securely.</p><a href="profile.jsp" class="feat-btn">Profile</a></div></div>
    </div>
  </div>
</div>
</body>
</html>
