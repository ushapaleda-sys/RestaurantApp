<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.restaurant.model.Order"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Orders — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Customer Orders</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="adminDashboard.jsp" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Dashboard</a>
      <a href="logout" class="nav-pill-logout ms-2">Logout</a>
    </div>
  </div>
</nav>

<div class="container py-4">

  <div class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <h3 class="fw-bold m-0" style="color: var(--admin-text);">All Orders</h3>
      <p class="text-muted m-0" style="font-size: 0.88rem;">Monitor customer purchase history and order status</p>
    </div>
  </div>

  <div class="admin-table-container">
    <div class="table-responsive">
      <table class="table admin-table align-middle">
        <thead>
          <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Restaurant ID</th>
            <th>Total Amount</th>
            <th>Payment Method</th>
            <th>Status</th>
            <th>Order Date</th>
            <th class="text-end">Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
          List<Order> orders = (List<Order>) request.getAttribute("orders");
          if(orders != null && !orders.isEmpty()){
              for(Order order : orders){
          %>
          <tr>
            <td class="fw-bold" style="color: var(--admin-primary);">#<%=order.getOrderId()%></td>
            <td><span class="badge bg-light text-dark border px-2 py-1">User #<%=order.getUserId()%></span></td>
            <td><span class="badge bg-light text-dark border px-2 py-1">Rest #<%=order.getRestaurantId()%></span></td>
            <td class="fw-bold" style="color: var(--admin-accent);">₹ <%=order.getTotalAmount()%></td>
            <td><span class="badge bg-white text-secondary border px-2 py-1"><%=order.getPaymentMethod() != null ? order.getPaymentMethod() : "N/A"%></span></td>
            <td>
              <% String st = order.getStatus() != null ? order.getStatus().toLowerCase() : ""; %>
              <span class="admin-status-badge <%= st.contains("deliver") ? "delivered" : (st.contains("cancel") ? "cancelled" : "pending") %>">
                ● <%=order.getStatus() != null ? order.getStatus() : "Placed"%>
              </span>
            </td>
            <td style="color: var(--admin-text-muted); font-size: 0.85rem;"><%=order.getOrderDate() != null ? order.getOrderDate() : "—"%></td>
            <td class="text-end">
              <a href="orderDetails?orderId=<%=order.getOrderId()%>" class="admin-btn-secondary py-1 px-3" style="font-size:0.8rem;">
                View Details
              </a>
            </td>
          </tr>
          <%
              }
          } else {
          %>
          <tr>
            <td colspan="8" class="text-center py-4 text-muted">No Orders Found</td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>

</div>

</body>
</html>