<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.restaurant.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if(user == null){ response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>My Profile — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f5f5f5;font-family:'Inter',sans-serif;}
  .profile-wrap{padding:50px 15px;}
  .profile-card{max-width:740px;margin:0 auto;background:#fff;border:1px solid #e9e9eb;border-radius:18px;overflow:hidden;box-shadow:0 4px 24px rgba(0,0,0,0.08);}
  .profile-header{background:linear-gradient(135deg,#fc8019,#ffc107);padding:44px 30px;text-align:center;}
  .avatar{width:80px;height:80px;border-radius:50%;background:rgba(255,255,255,0.25);border:2px solid rgba(255,255,255,0.5);display:flex;align-items:center;justify-content:center;font-size:1.9rem;font-weight:900;color:#fff;margin:0 auto 16px;}
  .profile-header h2{color:#fff;font-weight:800;font-size:1.6rem;}
  .profile-header p{color:rgba(255,255,255,0.8);font-size:0.85rem;margin-top:4px;}
  .profile-body{padding:36px;}
  .field-label{font-size:0.72rem;font-weight:700;letter-spacing:1px;text-transform:uppercase;color:#888;margin-bottom:5px;}
  .field-val{background:#f9f9fb;border:1px solid #e9e9eb;border-radius:9px;padding:11px 14px;color:#1c1c1e;font-size:0.94rem;margin-bottom:16px;}
  .section-title{font-weight:700;color:#1c1c1e;font-size:1.1rem;margin:24px 0 16px;padding-bottom:8px;border-bottom:2px solid #fc8019;}
  .btn-update{background:#fc8019;color:#fff;border:none;font-weight:700;padding:11px 28px;border-radius:8px;cursor:pointer;transition:0.2s;}
  .btn-update:hover{background:#e16f0e;}
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
<div class="profile-wrap">
  <div class="profile-card">
    <div class="profile-header">
      <div class="avatar"><%= user.getName().substring(0,1).toUpperCase() %></div>
      <h2><%= user.getName() %></h2>
      <p>FoodieApp Member</p>
    </div>
    <div class="profile-body">

      <%-- VIEW section --%>
      <div class="section-title">My Details</div>
      <div class="row g-0">
        <div class="col-md-6 pe-md-3"><div class="field-label">Full Name</div><div class="field-val"><%= user.getName() %></div></div>
        <div class="col-md-6"><div class="field-label">Username</div><div class="field-val">@<%= user.getUsername() %></div></div>
        <div class="col-md-6 pe-md-3"><div class="field-label">Email</div><div class="field-val"><%= user.getEmail() %></div></div>
        <div class="col-md-6"><div class="field-label">Phone</div><div class="field-val"><%= user.getPhone() %></div></div>
        <div class="col-12"><div class="field-label">Address</div><div class="field-val"><%= user.getAddress() %></div></div>
      </div>

      <%-- UPDATE section - UpdateProfileServlet uses doPost at /updateProfile --%>
      <div class="section-title">Update Profile</div>
      <form action="updateProfile" method="post">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">
        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" value="<%= user.getName() %>" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" value="<%= user.getUsername() %>" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Phone</label>
            <input type="text" name="phone" class="form-control" value="<%= user.getPhone() %>" required>
          </div>
          <div class="col-12">
            <label class="form-label">Address</label>
            <input type="text" name="address" class="form-control" value="<%= user.getAddress() %>" required>
          </div>
          <div class="col-12">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter new password" required>
          </div>
          <div class="col-12">
            <button type="submit" class="btn-update">Update Profile</button>
          </div>
        </div>
      </form>

    </div>
  </div>
</div>
</body>
</html>
