<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.Menu" %>
<%@ page import="com.restaurant.model.User" %>
<% User user=(User)session.getAttribute("loggedInUser"); if(user==null){response.sendRedirect("login.jsp");return;} %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>Menu — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f2f2f7;font-family:'Inter',sans-serif;}
  .page-hero{background:#fff;border-bottom:1px solid #e5e5ea;padding:36px 0 28px;}
  .page-hero h1{font-weight:800;font-size:1.9rem;color:#1c1c1e;}
  .red-label{font-size:0.7rem;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:#e23744;margin-bottom:8px;}
  .filter-pill{display:inline-block;background:#fff;border:1px solid #e5e5ea;color:#6e6e73;font-size:0.82rem;font-weight:600;padding:7px 16px;border-radius:20px;text-decoration:none;transition:0.2s;margin:3px;}
  .filter-pill:hover{border-color:#e23744;color:#e23744;}
  .m-card{background:#fff;border:1px solid #e5e5ea;border-radius:14px;overflow:hidden;transition:0.22s;box-shadow:0 2px 12px rgba(0,0,0,0.06);}
  .m-card:hover{transform:translateY(-5px);box-shadow:0 8px 28px rgba(0,0,0,0.11);border-color:#e23744;}
  .m-img{width:100%;height:195px;object-fit:cover;}
  .m-body{padding:18px;}
  .m-body h4{font-weight:700;color:#1c1c1e;font-size:1rem;margin-bottom:5px;}
  .m-body p{color:#6e6e73;font-size:0.83rem;margin-bottom:10px;}
  .m-price{color:#e23744;font-weight:800;font-size:1.25rem;margin-bottom:12px;}
  .btn-add{display:block;background:#e23744;color:#fff;text-align:center;padding:10px;border-radius:8px;font-weight:600;font-size:0.88rem;border:none;width:100%;cursor:pointer;transition:0.2s;}
  .btn-add:hover{background:#c42f3b;}
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
<div class="page-hero">
  <div class="container">
    <div class="red-label">✦ Menu</div>
    <h1>Restaurant Menu</h1>
    <p style="color:#6e6e73;font-size:0.9rem;">Choose your favourite dishes 🍕 🍔 🍜</p>
  </div>
</div>
<div class="container py-4">
  <div class="row mb-4">
    <div class="col-md-6">
      <form action="menu" method="get" class="d-flex gap-2">
        <input type="hidden" name="restaurantId" value="<%= session.getAttribute("restaurantId") %>">
        <input type="text" name="search" class="form-control" placeholder="🔍 Search dishes..."
          value="<%= request.getAttribute("searchValue")!=null?request.getAttribute("searchValue"):"" %>">
        <button class="btn btn-danger">Search</button>
      </form>
    </div>
  </div>
  <div class="mb-4">
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>" class="filter-pill">All</a>
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>&category=Pizza" class="filter-pill">🍕 Pizza</a>
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>&category=Burger" class="filter-pill">🍔 Burger</a>
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>&category=Biryani" class="filter-pill">🍗 Biryani</a>
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>&category=Fried Rice" class="filter-pill">🍚 Fried Rice</a>
  </div>
  <div class="row g-4">
    <%
    List<Menu> menuList=(List<Menu>)request.getAttribute("menuList");
           if(menuList!=null&&!menuList.isEmpty()){for(Menu item:menuList){
             String img="default.jpg"; String n=item.getName().toLowerCase();
             if(n.contains("biryani"))img="biryani.jpg";
             else if(n.contains("burger") && n.contains("zinger"))img="zinger.jpg";
             else if(n.contains("burger"))img="burger.jpg";
             else if(n.contains("pizza"))img="pizza.jpg";
             else if(n.contains("fried rice"))img="friedrice.jpg";
             else if(n.contains("dosa"))img="dosa.jpg";
             else if(n.contains("idli") || n.contains("vada"))img="idalivada.jpg";
             else if(n.contains("sea food") || n.contains("seafood") || n.contains("fish") || n.contains("prawn"))img="sea_food.jpg";
             else if(n.contains("fries"))img="fries.jpg";
             else if(n.contains("coffee"))img="coffee.jpg";
             else if(n.contains("mini meals"))img="minimeals.jpg";
             else if(n.contains("naan") || n.contains("garlic bread") || n.contains("breadstick"))img="garlicbread.jpg";
             else if(n.contains("poori"))img="poori.jpg";
             else if(n.contains("popcorn"))img="popcorn.jpg";
             else if(n.contains("chicken bucket"))img="chickenbucket.jpg";
             else if(n.contains("pepsi") || n.contains("cola"))img="pepsi.jpg";
    %>
    <div class="col-md-6 col-lg-4">
      <div class="m-card h-100">
        <img src="images/menu/<%= img %>" class="m-img" alt="<%= item.getName() %>">
        <div class="m-body">
          <h4><%= item.getName() %></h4>
          <p><%= item.getDescription() %></p>
          <div class="m-price">₹<%= item.getPrice() %></div>
          <form action="addToCart" method="post">
            <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
            <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
            <button type="submit" class="btn-add">+ Add to Cart</button>
          </form>
        </div>
      </div>
    </div>
    <% }}else{ %><div class="col-12"><div class="alert alert-warning text-center">No items found.</div></div><% } %>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
