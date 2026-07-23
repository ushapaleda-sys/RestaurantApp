<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

	<nav class="navbar navbar-expand-lg admin-navbar">
		<div class="container">
			<a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
			<span class="admin-badge">⚙ Control Panel</span>
			<div class="ms-auto">
				<a href="logout" class="nav-pill-logout">Logout</a>
			</div>
		</div>
	</nav>

	<div class="container py-5">

		<div class="text-center mb-5">
			<h2 class="fw-bold display-6" style="color: var(--admin-text);">Welcome, Admin 👋</h2>
			<p style="color: var(--admin-text-muted); font-size: 0.95rem;">Manage your restaurant system, view orders, users, and performance metrics</p>
		</div>

		<div class="row g-4">

			<!-- Add Restaurant -->
			<div class="col-md-4">
				<div class="admin-card text-center h-100 d-flex flex-column justify-content-between">
					<div>
						<div class="admin-stat-icon mx-auto mb-3" style="font-size: 2rem;">🏪</div>
						<h4 class="fw-bold mb-2" style="font-size: 1.15rem; color: var(--admin-text);">Add Restaurant</h4>
						<p style="color: var(--admin-text-muted); font-size: 0.88rem;">Create and onboard a new restaurant listing.</p>
					</div>
					<div class="mt-4">
						<a href="addRestaurant.jsp" class="admin-btn-primary w-100">
							+ Add Restaurant
						</a>
					</div>
				</div>
			</div>

			<!-- Manage Restaurants -->
			<div class="col-md-4">
				<div class="admin-card text-center h-100 d-flex flex-column justify-content-between">
					<div>
						<div class="admin-stat-icon mx-auto mb-3" style="font-size: 2rem; background: #E0F2FE; color: #0284C7;">📋</div>
						<h4 class="fw-bold mb-2" style="font-size: 1.15rem; color: var(--admin-text);">Manage Restaurants</h4>
						<p style="color: var(--admin-text-muted); font-size: 0.88rem;">View, edit, and update active restaurant profiles.</p>
					</div>
					<div class="mt-4">
						<a href="viewRestaurants" class="admin-btn-primary w-100" style="background: linear-gradient(135deg, #38BDF8 0%, #2563EB 100%) !important;">
							Manage Listing
						</a>
					</div>
				</div>
			</div>

			<!-- Manage Menu -->
			<div class="col-md-4">
				<div class="admin-card text-center h-100 d-flex flex-column justify-content-between">
					<div>
						<div class="admin-stat-icon mx-auto mb-3" style="font-size: 2rem; background: #ECFDF5; color: #059669;">🍔</div>
						<h4 class="fw-bold mb-2" style="font-size: 1.15rem; color: var(--admin-text);">Manage Menu</h4>
						<p style="color: var(--admin-text-muted); font-size: 0.88rem;">Add, edit, or disable menu food items.</p>
					</div>
					<div class="mt-4">
						<a href="viewMenus" class="admin-btn-primary w-100" style="background: linear-gradient(135deg, #10B981 0%, #059669 100%) !important;">
							Manage Menu
						</a>
					</div>
				</div>
			</div>

			<!-- Orders -->
			<div class="col-md-4">
				<div class="admin-card text-center h-100 d-flex flex-column justify-content-between">
					<div>
						<div class="admin-stat-icon mx-auto mb-3" style="font-size: 2rem; background: #FFFBEB; color: #D97706;">🛒</div>
						<h4 class="fw-bold mb-2" style="font-size: 1.15rem; color: var(--admin-text);">Customer Orders</h4>
						<p style="color: var(--admin-text-muted); font-size: 0.88rem;">Monitor real-time incoming and past orders.</p>
					</div>
					<div class="mt-4">
						<a href="viewOrders" class="admin-btn-primary w-100" style="background: linear-gradient(135deg, #F59E0B 0%, #D97706 100%) !important;">
							View Orders
						</a>
					</div>
				</div>
			</div>

			<!-- Users -->
			<div class="col-md-4">
				<div class="admin-card text-center h-100 d-flex flex-column justify-content-between">
					<div>
						<div class="admin-stat-icon mx-auto mb-3" style="font-size: 2rem; background: #F3E8FF; color: #7C3AED;">👥</div>
						<h4 class="fw-bold mb-2" style="font-size: 1.15rem; color: var(--admin-text);">Registered Users</h4>
						<p style="color: var(--admin-text-muted); font-size: 0.88rem;">View customer user accounts and activity.</p>
					</div>
					<div class="mt-4">
						<a href="viewUsers" class="admin-btn-primary w-100" style="background: linear-gradient(135deg, #8B5CF6 0%, #6D28D9 100%) !important;">
							View Users
						</a>
					</div>
				</div>
			</div>

			<!-- Reports -->
			<div class="col-md-4">
				<div class="admin-card text-center h-100 d-flex flex-column justify-content-between">
					<div>
						<div class="admin-stat-icon mx-auto mb-3" style="font-size: 2rem; background: #F1F5F9; color: #475569;">📊</div>
						<h4 class="fw-bold mb-2" style="font-size: 1.15rem; color: var(--admin-text);">Reports & Analytics</h4>
						<p style="color: var(--admin-text-muted); font-size: 0.88rem;">Track sales trends, revenue, and stats.</p>
					</div>
					<div class="mt-4">
						<a href="reports" class="admin-btn-primary w-100" style="background: linear-gradient(135deg, #475569 0%, #1E293B 100%) !important;">
							View Reports
						</a>
					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>