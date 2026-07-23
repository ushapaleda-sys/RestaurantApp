<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.Map,java.util.ArrayList" %>
<%@ page import="com.restaurant.model.CartItem" %>
<%@ page import="com.restaurant.model.User" %>
<%@ page import="com.restaurant.model.Restaurant" %>
<%@ page import="com.restaurant.dao.RestaurantDAO" %>
<%@ page import="com.restaurant.daoimpl.RestaurantDAOImpl" %>
<%
User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }

    Map<Integer, List<CartItem>> allCarts =
        (Map<Integer, List<CartItem>>) session.getAttribute("allCarts");

    // Get current restaurant from session
    Integer currentRestaurantId = (Integer) session.getAttribute("restaurantId");

    // DAO to fetch restaurant names
    RestaurantDAO restDAO = new RestaurantDAOImpl();

    // Get cart for current restaurant only
    List<CartItem> cart = new ArrayList<>();
    if(allCarts != null && currentRestaurantId != null){
        List<CartItem> restaurantCart = allCarts.get(currentRestaurantId);
        if(restaurantCart != null) cart = restaurantCart;
    }

    // Get current restaurant name
    String currentRestName = "Restaurant";
    if(currentRestaurantId != null){
        Restaurant currentRest = restDAO.getRestaurantById(currentRestaurantId);
        if(currentRest != null) currentRestName = currentRest.getName();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Cart — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f2f2f2;font-family:'Inter',sans-serif;}
  .page-hero{background:#fff;border-bottom:1px solid #e8e8e8;padding:32px 0 24px;}
  .page-hero h2{font-weight:800;font-size:1.8rem;color:#1c1c1e;}
  .restaurant-label{
    background:linear-gradient(135deg,#fc8019,#ffc107);
    color:#fff;font-weight:700;font-size:0.85rem;
    padding:8px 18px;border-radius:20px;display:inline-block;
    margin-bottom:18px;
  }
  .cart-wrap{background:#fff;border:1px solid #e8e8e8;border-radius:14px;overflow:hidden;box-shadow:0 2px 12px rgba(0,0,0,0.06);}
  .cart-table thead th{background:#fafafa!important;color:#686b78!important;font-size:0.73rem;letter-spacing:1px;text-transform:uppercase;font-weight:700;padding:14px 16px!important;border-color:#e8e8e8!important;text-align:center;}
  .cart-table tbody td{color:#1c1c1e!important;border-color:#f0f0f0!important;padding:13px 16px!important;vertical-align:middle;text-align:center;}
  .cart-table tbody tr:hover td{background:#fff8f1!important;}
  .item-name{text-align:left!important;font-weight:600;color:#1c1c1e!important;}
  .item-price{color:#686b78;}
  .item-total{color:#fc8019;font-weight:700;}
  .qty-inc{background:#e8f5e9;color:#26a541;border:1.5px solid #a5d6a7;border-radius:7px;width:32px;height:32px;font-weight:700;font-size:1rem;cursor:pointer;transition:0.2s;}
  .qty-inc:hover{background:#c8e6c9;transform:scale(1.1);}
  .qty-dec{background:#fff3e8;color:#fc8019;border:1.5px solid #ffd5a8;border-radius:7px;width:32px;height:32px;font-weight:700;font-size:1rem;cursor:pointer;transition:0.2s;}
  .qty-dec:hover{background:#ffe0c0;transform:scale(1.1);}
  .btn-remove{background:#fff0f1;color:#e23744;border:1.5px solid #f5b8bc;border-radius:7px;padding:5px 12px;font-size:0.8rem;font-weight:600;cursor:pointer;transition:0.2s;}
  .btn-remove:hover{background:#e23744;color:#fff;}
  .grand-row td{background:#fafafa!important;font-weight:800;}
  .grand-label{text-align:right!important;color:#686b78!important;font-size:0.9rem;}
  .grand-amt{color:#fc8019!important;font-size:1.3rem;font-weight:800!important;}
  .btn-proceed{background:#fc8019;color:#fff;border:none;font-weight:700;padding:14px 40px;border-radius:10px;font-size:0.95rem;cursor:pointer;transition:0.2s;box-shadow:0 4px 16px rgba(252,128,25,0.35);}
  .btn-proceed:hover{background:#e16f0e;transform:translateY(-2px);box-shadow:0 8px 24px rgba(252,128,25,0.45);}
  .other-carts{background:#fff;border:1px solid #e8e8e8;border-radius:14px;padding:20px;margin-top:24px;box-shadow:0 2px 12px rgba(0,0,0,0.06);}
  .other-carts h5{font-weight:700;color:#1c1c1e;margin-bottom:14px;font-size:0.95rem;}
  .other-cart-item{display:flex;justify-content:space-between;align-items:center;padding:10px 0;border-bottom:1px solid #f5f5f5;}
  .other-cart-item:last-child{border-bottom:none;}
  .other-rest-label{font-weight:600;color:#686b78;font-size:0.88rem;}
  .other-rest-count{background:#fff3e8;color:#fc8019;font-size:0.78rem;font-weight:700;padding:3px 10px;border-radius:20px;border:1px solid #ffd5a8;}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg" style="background:#fff;border-bottom:1px solid #e8e8e8;box-shadow:0 1px 12px rgba(0,0,0,0.07);padding:10px 0;position:sticky;top:0;z-index:1050;">
  <div class="container">
    <a class="navbar-brand" href="home.jsp" style="font-family:'Poppins',sans-serif;font-size:1.5rem;font-weight:900;color:#fc8019;">🍽 FoodieApp</a>
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
    <h2>🛒 Your Cart</h2>
    <p style="color:#686b78;font-size:0.9rem;margin-top:4px;">Hello, <%=user.getName()%> — items are saved per restaurant</p>
  </div>
</div>

<div class="container py-4">

  <%
  if(cart != null && !cart.isEmpty()){
  %>

    <%-- Show current restaurant's cart --%>
    <div class="restaurant-label">
      🍽 <%=currentRestName%> — Current Cart
    </div>

    <div class="cart-wrap mb-4">
      <div class="table-responsive">
        <table class="table cart-table mb-0">
          <thead>
            <tr><th>Item</th><th>Price</th><th>Qty</th><th>Total</th><th>Actions</th></tr>
          </thead>
          <tbody>
            <%
            double total = 0;
                          for(CartItem item : cart){
                            double it = item.getPrice() * item.getQuantity();
                            total += it;
            %>
            <tr>
              <td class="item-name"><%=item.getName()%></td>
              <td class="item-price">₹<%=item.getPrice()%></td>
              <td><strong><%=item.getQuantity()%></strong></td>
              <td class="item-total">₹<%=it%></td>
              <td>
                <div class="d-flex align-items-center gap-2 justify-content-center">
                  <form action="updateCart" method="post" class="m-0">
                    <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
                    <input type="hidden" name="action" value="increase">
                    <button class="qty-inc">+</button>
                  </form>
                  <form action="updateCart" method="post" class="m-0">
                    <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
                    <input type="hidden" name="action" value="decrease">
                    <button class="qty-dec">−</button>
                  </form>
                  <form action="removeFromCart" method="post" class="m-0">
                    <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
                    <button class="btn-remove">Remove</button>
                  </form>
                </div>
              </td>
            </tr>
            <%
            }
            %>
            <tr class="grand-row">
              <td colspan="3" class="grand-label">Grand Total</td>
              <td class="grand-amt">₹<%=total%></td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="text-end mb-4">
      <a href="payment.jsp" class="btn-proceed">Proceed to Payment →</a>
    </div>

    <%-- Show other restaurants' carts if any --%>
    <%
    boolean hasOtherCarts = false;
          if(allCarts != null){
            for(Map.Entry<Integer, List<CartItem>> entry : allCarts.entrySet()){
              if(!entry.getKey().equals(currentRestaurantId) && !entry.getValue().isEmpty()){
                hasOtherCarts = true; break;
              }
            }
          }
          if(hasOtherCarts){
    %>
    <div class="other-carts">
      <h5>🛍 Items saved from other restaurants</h5>
      <%
      for(Map.Entry<Integer, List<CartItem>> entry : allCarts.entrySet()){
                if(!entry.getKey().equals(currentRestaurantId) && !entry.getValue().isEmpty()){
                  int restId = entry.getKey();
                  List<CartItem> otherCart = entry.getValue();
                  double otherTotal = 0;
                  for(CartItem ci : otherCart) otherTotal += ci.getPrice() * ci.getQuantity();
                  // Get restaurant name
                  String otherRestName = "Restaurant #" + restId;
                  Restaurant otherRest = restDAO.getRestaurantById(restId);
                  if(otherRest != null) otherRestName = otherRest.getName();
      %>
      <div class="other-cart-item">
        <div>
          <div class="other-rest-label">🍽 <%= otherRestName %></div>
          <div style="font-size:0.78rem;color:#93959f;margin-top:2px;"><%= otherCart.size() %> item(s) — ₹<%= otherTotal %></div>
        </div>
        <a href="switchCart?restaurantId=<%= restId %>" style="background:#fc8019;color:#fff;font-size:0.8rem;font-weight:600;padding:6px 14px;border-radius:8px;text-decoration:none;">View Cart</a>
      </div>
      <% }} %>
    </div>
    <% } %>

  <% } else { %>
    <%-- Empty cart --%>
    <div class="text-center py-5">
      <div style="font-size:4rem;margin-bottom:16px;">🛒</div>
      <h5 style="font-weight:800;color:#1c1c1e;font-size:1.3rem;">Your cart is empty</h5>
      <p style="color:#686b78;margin:10px 0 24px;">Add items from a restaurant to get started</p>
      <a href="restaurants" style="background:#fc8019;color:#fff;font-weight:700;padding:13px 32px;border-radius:10px;text-decoration:none;display:inline-block;box-shadow:0 4px 16px rgba(252,128,25,0.35);">Browse Restaurants</a>
    </div>
  <% } %>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
