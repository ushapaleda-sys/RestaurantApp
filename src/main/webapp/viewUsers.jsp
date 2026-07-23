<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.restaurant.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered Users — FoodieApp Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<nav class="navbar navbar-expand-lg admin-navbar">
  <div class="container">
    <a class="navbar-brand" href="adminDashboard.jsp">🍽 FoodieApp</a>
    <span class="admin-badge">⚙ Registered Users</span>
    <div class="ms-auto d-flex gap-2 align-items-center">
      <a href="adminDashboard.jsp" class="admin-btn-secondary py-1 px-3" style="font-size: 0.82rem;">← Dashboard</a>
      <a href="logout" class="nav-pill-logout ms-2">Logout</a>
    </div>
  </div>
</nav>

<div class="container py-4">

  <div class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <h3 class="fw-bold m-0" style="color: var(--admin-text);">User Accounts</h3>
      <p class="text-muted m-0" style="font-size: 0.88rem;">List of all registered customer profiles</p>
    </div>
  </div>

  <div class="admin-table-container">
    <div class="table-responsive">
      <table class="table admin-table align-middle">
        <thead>
          <tr>
            <th>User ID</th>
            <th>Full Name</th>
            <th>Username</th>
            <th>Email Address</th>
            <th>Phone Number</th>
            <th>Address</th>
          </tr>
        </thead>
        <tbody>
          <%
          List<User> users = (List<User>) request.getAttribute("users");
          if(users != null && !users.isEmpty()){
              for(User user : users){
          %>
          <tr>
            <td class="fw-bold" style="color: var(--admin-primary);">#<%=user.getUserId()%></td>
            <td class="fw-bold" style="color: var(--admin-text);"><%=user.getName()%></td>
            <td><span class="badge bg-light text-dark border px-2 py-1">@<%=user.getUsername()%></span></td>
            <td style="color: var(--admin-text-mid);"><%=user.getEmail()%></td>
            <td style="color: var(--admin-text-mid);"><%=user.getPhone()%></td>
            <td style="color: var(--admin-text-muted); font-size: 0.88rem;"><%=user.getAddress()%></td>
          </tr>
          <%
              }
          } else {
          %>
          <tr>
            <td colspan="6" class="text-center py-4 text-muted">No Registered Users Found</td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>

</div>

</body>
</html>