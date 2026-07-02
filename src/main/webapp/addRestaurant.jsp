<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>Add Restaurant — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body{background:#f2f2f7;font-family:'Inter',sans-serif;}
  .form-wrap{min-height:100vh;display:flex;align-items:center;justify-content:center;padding:50px 15px;}
  .form-card{background:#fff;border:1px solid #e5e5ea;border-radius:18px;overflow:hidden;max-width:560px;width:100%;box-shadow:0 4px 24px rgba(0,0,0,0.08);}
  .form-header{background:linear-gradient(135deg,#e23744,#ff6c37);padding:32px 30px;}
  .form-header h3{color:#fff;font-weight:800;font-size:1.5rem;}
  .form-header p{color:rgba(255,255,255,0.8);font-size:0.85rem;margin-top:4px;}
  .form-body{padding:32px;}
  .btn-submit{background:#e23744;color:#fff;border:none;font-weight:700;padding:12px;border-radius:10px;width:100%;font-size:0.95rem;cursor:pointer;transition:0.2s;}
  .btn-submit:hover{background:#c42f3b;}
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
<div class="form-wrap">
  <div class="form-card">
    <div class="form-header"><h3>Add New Restaurant</h3><p>Fill in details to list a restaurant on FoodieApp</p></div>
    <div class="form-body">
      <form action="addRestaurant" method="post">
        <div class="mb-3"><label class="form-label">Restaurant Name</label><input type="text" name="restaurantName" class="form-control" placeholder="e.g. Empire Restaurant" required></div>
        <div class="mb-3"><label class="form-label">Address</label><input type="text" name="address" class="form-control" placeholder="Full address" required></div>
        <div class="mb-3"><label class="form-label">Cuisine Type</label><input type="text" name="cuisineType" class="form-control" placeholder="e.g. North Indian, Chinese" required></div>
        <div class="mb-3"><label class="form-label">Rating (0.0 – 5.0)</label><input type="number" step="0.1" min="0" max="5" name="rating" class="form-control" placeholder="4.5" required></div>
        <div class="mb-4"><label class="form-label">Image Filename</label><input type="text" name="imagePath" class="form-control" placeholder="empire.jpg"><small style="color:#6e6e73;">Place image in images/restaurants/ folder</small></div>
        <button type="submit" class="btn-submit">Add Restaurant</button>
      </form>
    </div>
  </div>
</div>
</body></html>
