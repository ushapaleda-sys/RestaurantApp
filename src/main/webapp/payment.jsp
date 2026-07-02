<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Payment — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f5f5f5;font-family:'Inter',sans-serif;}
  .pay-wrap{min-height:90vh;display:flex;align-items:center;justify-content:center;padding:50px 15px;}
  .pay-card{max-width:560px;width:100%;background:#fff;border:1px solid #e9e9eb;border-radius:18px;overflow:hidden;box-shadow:0 4px 24px rgba(0,0,0,0.08);}
  .pay-header{background:linear-gradient(135deg,#fc8019,#ffc107);padding:36px;text-align:center;}
  .pay-header h3{color:#fff;font-weight:800;font-size:1.6rem;}
  .pay-header p{color:rgba(255,255,255,0.85);font-size:0.88rem;margin-top:6px;}
  .pay-body{padding:34px;}
  .pay-section-label{font-size:0.72rem;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:#888;margin-bottom:14px;}
  .pay-option{background:#fff;border:1.5px solid #e9e9eb;border-radius:12px;padding:16px 20px;margin-bottom:12px;cursor:pointer;transition:0.2s;display:flex;align-items:center;gap:14px;}
  .pay-option:hover{border-color:#fc8019;background:#fff8f1;}
  .pay-option input[type=radio]{accent-color:#fc8019;width:18px;height:18px;}
  .pay-option label{color:#1c1c1e;font-weight:600;cursor:pointer;margin:0;font-size:0.95rem;}
  .pay-sub{color:#888;font-size:0.78rem;}
  .btn-pay{background:#fc8019;color:#fff;border:none;font-weight:700;padding:13px;border-radius:10px;width:100%;font-size:0.95rem;cursor:pointer;transition:0.2s;}
  .btn-pay:hover{background:#e16f0e;}
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
<div class="pay-wrap">
  <div class="pay-card">
    <div class="pay-header">
      <div style="font-size:2.2rem;margin-bottom:10px;">💳</div>
      <h3>Secure Payment</h3>
      <p>Choose your preferred payment method</p>
    </div>
    <div class="pay-body">
      <%-- PaymentServlet has doPost → form method must be POST --%>
      <form action="payment" method="post">
        <div class="pay-section-label">Payment Method</div>
        <div class="pay-option">
          <input type="radio" name="paymentMethod" id="upi" value="UPI" checked>
          <div><label for="upi">📱 UPI / GPay / PhonePe</label><div class="pay-sub">Instant transfer via UPI ID</div></div>
        </div>
        <div class="pay-option">
          <input type="radio" name="paymentMethod" id="card" value="Card">
          <div><label for="card">💳 Credit / Debit Card</label><div class="pay-sub">Visa, Mastercard, RuPay</div></div>
        </div>
        <div class="pay-option">
          <input type="radio" name="paymentMethod" id="cod" value="COD">
          <div><label for="cod">💵 Cash on Delivery</label><div class="pay-sub">Pay when your order arrives</div></div>
        </div>
        <div class="mt-4">
          <button type="submit" class="btn-pay">Confirm & Pay</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
