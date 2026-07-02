<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body { background: #f2f2f7; font-family: 'Inter', sans-serif; }
  .auth-wrap { min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 30px 15px; }
  .auth-card { background: #fff; border: 1px solid #e5e5ea; border-radius: 18px; padding: 44px 40px; width: 100%; max-width: 420px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); }
  .auth-logo { font-size: 1.8rem; font-weight: 900; color: #e23744; text-align: center; margin-bottom: 4px; }
  .auth-sub  { text-align: center; color: #aeaeb2; font-size: 0.82rem; margin-bottom: 32px; }
  .btn-submit { background: #e23744; color: #fff; border: none; font-weight: 700; padding: 12px; border-radius: 10px; width: 100%; font-size: 0.95rem; cursor: pointer; transition: 0.2s; }
  .btn-submit:hover { background: #c42f3b; }
  .auth-link { text-align: center; color: #6e6e73; font-size: 0.88rem; margin-top: 18px; }
  .auth-link a { color: #e23744; font-weight: 600; }
  .error-box { background: #fff0f1; border: 1px solid #f5b8bc; border-radius: 8px; padding: 11px 14px; color: #c42f3b; font-size: 0.88rem; margin-bottom: 20px; }
</style>
</head>
<body>
<div class="auth-wrap">
  <div class="auth-card">
    <div class="auth-logo">🍽 FoodieApp</div>
    <div class="auth-sub">Sign in to your account</div>
    <% String error = (String) request.getAttribute("error"); if(error != null) { %>
    <div class="error-box">⚠ <%= error %></div>
    <% } %>
    <form action="login" method="post">
      <div class="mb-3">
        <label class="form-label">Username</label>
        <input type="text" name="username" class="form-control" placeholder="Enter username" required>
      </div>
      <div class="mb-4">
        <label class="form-label">Password</label>
        <input type="password" name="password" class="form-control" placeholder="••••••••" required>
      </div>
      <button type="submit" class="btn-submit">Sign In</button>
    </form>
    <div class="auth-link">Don't have an account? <a href="register.jsp">Register here</a></div>
  </div>
</div>
</body>
</html>
