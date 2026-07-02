<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.OrderItem" %>
<%@ page import="com.restaurant.model.Order" %>
<%@ page import="com.restaurant.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }
    Order order = (Order) request.getAttribute("order");
    List<OrderItem> items = (List<OrderItem>) request.getAttribute("orderItems");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Order Details — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f5f5f5;font-family:'Inter',sans-serif;}
  .page-hero{background:linear-gradient(135deg,#fc8019,#ffc107);padding:36px 0 28px;}
  .page-hero h2{font-weight:800;font-size:1.9rem;color:#fff;}
  .order-id-badge{display:inline-block;background:rgba(255,255,255,0.25);border:1px solid rgba(255,255,255,0.4);color:#fff;font-weight:700;font-size:0.85rem;padding:5px 16px;border-radius:20px;margin-top:8px;}
  .info-card{background:#fff;border:1px solid #e9e9eb;border-radius:14px;padding:24px;margin-bottom:20px;box-shadow:0 2px 12px rgba(0,0,0,0.06);}
  .info-row{display:flex;justify-content:space-between;padding:10px 0;border-bottom:1px solid #f0f0f0;}
  .info-row:last-child{border-bottom:none;}
  .i-key{color:#888;font-size:0.85rem;font-weight:600;}
  .i-val{color:#1c1c1e;font-weight:600;}
  .i-orange{color:#fc8019;font-weight:800;}
  .status-badge{display:inline-block;background:#e8f5e9;border:1px solid #a5d6a7;color:#2e7d32;font-size:0.78rem;font-weight:700;padding:3px 10px;border-radius:20px;}
  .detail-wrap{background:#fff;border:1px solid #e9e9eb;border-radius:14px;overflow:hidden;box-shadow:0 2px 12px rgba(0,0,0,0.07);}
  .detail-table thead th{background:#f9f9fb!important;color:#3a3a3c!important;font-size:0.76rem;letter-spacing:0.8px;text-transform:uppercase;font-weight:700;padding:14px!important;text-align:center;border-color:#e9e9eb!important;}
  .detail-table tbody td{color:#1c1c1e!important;border-color:#f0f0f0!important;padding:14px!important;vertical-align:middle;text-align:center;}
  .detail-table tbody tr:hover td{background:#fff8f1!important;}
  .grand-row td{background:#f9f9fb!important;font-weight:800;font-size:1.05rem;}
  .btn-orange{background:#fc8019;color:#fff;border:none;font-weight:700;padding:10px 24px;border-radius:8px;text-decoration:none;display:inline-block;transition:0.2s;}
  .btn-orange:hover{background:#e16f0e;color:#fff;}
  .btn-back{background:#fff;color:#888;border:1px solid #e9e9eb;font-weight:600;padding:10px 20px;border-radius:8px;text-decoration:none;display:inline-block;}
  .btn-back:hover{border-color:#fc8019;color:#fc8019;}
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
    <h2>Order Details</h2>
    <div class="order-id-badge">Order #<%= request.getAttribute("orderId") %></div>
  </div>
</div>

<div class="container py-4">

  <!-- Order Summary -->
  <% if(order != null){ %>
  <div class="info-card">
    <div class="info-row"><span class="i-key">Order ID</span><span class="i-val">#<%= order.getOrderId() %></span></div>
    <div class="info-row"><span class="i-key">Total Amount</span><span class="i-orange">₹<%= order.getTotalAmount() %></span></div>
    <div class="info-row"><span class="i-key">Payment Method</span><span class="i-val"><%= order.getPaymentMethod() != null ? order.getPaymentMethod() : "N/A" %></span></div>
    <div class="info-row"><span class="i-key">Status</span><span><span class="status-badge">● <%= order.getStatus() != null ? order.getStatus() : "Placed" %></span></span></div>
    <div class="info-row"><span class="i-key">Order Date</span><span class="i-val"><%= order.getOrderDate() != null ? order.getOrderDate() : "—" %></span></div>
  </div>
  <% } %>

  <!-- Order Items -->
  <div class="detail-wrap mb-4">
    <div class="table-responsive">
      <table class="table detail-table mb-0">
        <thead>
          <tr><th>#</th><th>Menu ID</th><th>Price</th><th>Quantity</th><th>Item Total</th></tr>
        </thead>
        <tbody>
          <%
            double grand = 0;
            int sno = 1;
            if(items != null && !items.isEmpty()){
              for(OrderItem item : items){
                double itemTotal = item.getPrice() * item.getQuantity();
                grand += itemTotal;
          %>
          <tr>
            <td><%= sno++ %></td>
            <td>Item #<%= item.getMenuId() %></td>
            <td>₹<%= item.getPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td style="color:#fc8019;font-weight:700;">₹<%= itemTotal %></td>
          </tr>
          <% }} %>
          <tr class="grand-row">
            <td colspan="4" style="text-align:right!important;color:#3a3a3c;">Grand Total</td>
            <td style="color:#fc8019!important;">₹<%= grand %></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

  <div class="d-flex gap-3">
    <a href="orders"      class="btn-back">← Back to Orders</a>
    <a href="restaurants" class="btn-orange">Order More</a>
  </div>
</div>
</body>
</html>
