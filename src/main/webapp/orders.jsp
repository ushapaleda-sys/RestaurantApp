<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.Order" %>
<%@ page import="com.restaurant.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }
    List<Order> orderList = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>My Orders — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f5f5f5;font-family:'Inter',sans-serif;}
  .page-hero{background:linear-gradient(135deg,#fc8019,#ffc107);padding:36px 0 28px;}
  .page-hero h2{font-weight:800;font-size:1.9rem;color:#fff;}
  .page-hero p{color:rgba(255,255,255,0.85);font-size:0.9rem;margin-top:4px;}
  .orders-wrap{background:#fff;border:1px solid #e9e9eb;border-radius:14px;overflow:hidden;box-shadow:0 2px 12px rgba(0,0,0,0.07);}
  .orders-table thead th{background:#f9f9fb!important;color:#3a3a3c!important;font-size:0.76rem;letter-spacing:0.8px;text-transform:uppercase;font-weight:700;padding:14px!important;text-align:center;border-color:#e9e9eb!important;}
  .orders-table tbody td{color:#1c1c1e!important;border-color:#f0f0f0!important;padding:14px!important;vertical-align:middle;text-align:center;}
  .orders-table tbody tr:hover td{background:#fff8f1!important;}
  .order-id{color:#fc8019;font-weight:700;}
  .order-amt{color:#fc8019;font-weight:700;font-size:1rem;}
  .order-date{color:#888;font-size:0.85rem;}
  .status-badge{display:inline-block;background:#e8f5e9;border:1px solid #a5d6a7;color:#2e7d32;font-size:0.78rem;font-weight:700;padding:3px 10px;border-radius:20px;}
  .payment-badge{display:inline-block;background:#fff8f1;border:1px solid #ffd5a8;color:#c85f00;font-size:0.78rem;font-weight:700;padding:3px 10px;border-radius:20px;}
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

<div class="page-hero">
  <div class="container">
    <h2>My Orders</h2>
    <p>Hello, <%= user.getName() %> — your complete order history</p>
  </div>
</div>

<div class="container py-4">
  <% if(orderList != null && !orderList.isEmpty()){ %>
  <div class="orders-wrap mb-4">
    <div class="table-responsive">
      <table class="table orders-table mb-0">
        <thead>
          <tr>
            <th>Order ID</th>
            <th>Total Amount</th>
            <th>Payment Method</th>
            <th>Status</th>
            <th>Order Date</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <% for(Order order : orderList){ %>
          <tr>
            <td class="order-id">#<%= order.getOrderId() %></td>
            <td class="order-amt">₹<%= order.getTotalAmount() %></td>
            <td><span class="payment-badge"><%= order.getPaymentMethod() != null ? order.getPaymentMethod() : "N/A" %></span></td>
            <td><span class="status-badge">● <%= order.getStatus() != null ? order.getStatus() : "Placed" %></span></td>
            <td class="order-date"><%= order.getOrderDate() != null ? order.getOrderDate() : "—" %></td>
            <td><a href="orderDetails?orderId=<%= order.getOrderId() %>" style="background:#fc8019;color:#fff;border:none;font-weight:600;padding:6px 14px;border-radius:7px;text-decoration:none;font-size:0.82rem;">View Details</a></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
  <% } else { %>
  <div class="text-center py-5">
    <div style="font-size:3rem;margin-bottom:12px;">📦</div>
    <h5 style="font-weight:700;color:#1c1c1e;">No orders yet</h5>
    <p style="color:#888;margin-bottom:20px;">Place your first order to see it here.</p>
    <a href="restaurants" style="background:#fc8019;color:#fff;font-weight:700;padding:11px 28px;border-radius:8px;text-decoration:none;display:inline-block;">Order Now</a>
  </div>
  <% } %>

  <div class="d-flex flex-wrap gap-3 justify-content-center mt-3">
    <a href="home.jsp"    class="nav-pill-outline">Home</a>
    <a href="restaurants" class="nav-pill-active">Order More</a>
    <a href="cart.jsp"    class="nav-pill-active">View Cart</a>
  </div>
</div>
</body>
</html>
