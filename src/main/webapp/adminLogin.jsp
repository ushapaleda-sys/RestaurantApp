<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Poppins:wght@600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/admin-style.css">
</head>
<body class="admin-page">

<div class="admin-form-wrap">
  <div class="admin-form-card">
    <div class="admin-form-header text-center">
      <div class="header-icon mx-auto">🔐</div>
      <h3>Admin Portal</h3>
      <p>Enter your credentials to access admin dashboard</p>
    </div>

    <div class="admin-form-body">
      <%
      String error = (String) request.getAttribute("error");
      if (error != null) {
      %>
      <div class="admin-error-msg">
        ⚠️ <%= error %>
      </div>
      <% } %>

      <form action="adminLogin" method="post">
        <div class="mb-3">
          <label class="form-label">Username</label>
          <input type="text" name="username" class="form-control" placeholder="Enter admin username" required>
        </div>

        <div class="mb-4">
          <label class="form-label">Password</label>
          <input type="password" name="password" class="form-control" placeholder="••••••••" required>
        </div>

        <button type="submit" class="admin-btn-submit">
          Sign In to Dashboard →
        </button>
      </form>
    </div>
  </div>
</div>

</body>
</html>