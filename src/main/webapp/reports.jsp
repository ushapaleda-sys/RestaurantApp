<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales & Statistics — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Sales & Statistics</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="adminDashboard.jsp" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Dashboard</a>
      <a href="logout" class="nav-pill-logout ms-2">Logout</a>
    </div>
  </div>
</nav>

<div class="container py-5">

  <div class="text-center mb-5">
    <h2 class="fw-bold display-6" style="color: var(--admin-text);">📊 Sales & Analytics Report</h2>
    <p style="color: var(--admin-text-muted); font-size: 0.95rem;">Real-time overview of system performance and metrics</p>
  </div>

  <div class="row g-4">

    <!-- Total Restaurants -->
    <div class="col-md-4">
      <div class="admin-stat-card">
        <div class="admin-stat-icon" style="background: #EDE9FF; color: #6C63FF;">🏪</div>
        <div class="admin-stat-info">
          <h4>Total Restaurants</h4>
          <div class="stat-value" style="color: #6C63FF;">${restaurants}</div>
        </div>
      </div>
    </div>

    <!-- Total Menu Items -->
    <div class="col-md-4">
      <div class="admin-stat-card">
        <div class="admin-stat-icon" style="background: #ECFDF5; color: #10B981;">🍔</div>
        <div class="admin-stat-info">
          <h4>Menu Items</h4>
          <div class="stat-value" style="color: #10B981;">${menus}</div>
        </div>
      </div>
    </div>

    <!-- Total Users -->
    <div class="col-md-4">
      <div class="admin-stat-card">
        <div class="admin-stat-icon" style="background: #F3E8FF; color: #8B5CF6;">👥</div>
        <div class="admin-stat-info">
          <h4>Registered Users</h4>
          <div class="stat-value" style="color: #8B5CF6;">${users}</div>
        </div>
      </div>
    </div>

    <!-- Total Orders -->
    <div class="col-md-6">
      <div class="admin-stat-card">
        <div class="admin-stat-icon" style="background: #FFFBEB; color: #F59E0B; width: 64px; height: 64px; font-size: 1.8rem;">🛒</div>
        <div class="admin-stat-info">
          <h4>Total Customer Orders</h4>
          <div class="stat-value" style="color: #F59E0B; font-size: 2rem;">${orders}</div>
        </div>
      </div>
    </div>

    <!-- Total Revenue -->
    <div class="col-md-6">
      <div class="admin-stat-card" style="background: linear-gradient(135deg, #6C63FF 0%, #48BFE3 100%); color: white;">
        <div class="admin-stat-icon" style="background: rgba(255,255,255,0.2); color: white; width: 64px; height: 64px; font-size: 1.8rem;">💰</div>
        <div class="admin-stat-info">
          <h4 style="color: rgba(255,255,255,0.85);">Total Gross Revenue</h4>
          <div class="stat-value" style="color: white; font-size: 2rem;">₹ ${revenue}</div>
        </div>
      </div>
    </div>

  </div>

  <div class="text-center mt-5">
    <a href="adminDashboard.jsp" class="admin-btn-secondary px-4 py-2">
      ← Back to Dashboard
    </a>
  </div>

</div>

</body>
</html>