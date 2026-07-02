<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register — FoodieApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
  body { background: #f2f2f7; font-family: 'Inter', sans-serif; }
  .auth-wrap { min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 40px 15px; }
  .auth-card { background: #fff; border: 1px solid #e5e5ea; border-radius: 18px; padding: 44px 40px; width: 100%; max-width: 540px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); }
  .auth-logo { font-size: 1.8rem; font-weight: 900; color: #e23744; text-align: center; margin-bottom: 4px; }
  .auth-sub  { text-align: center; color: #aeaeb2; font-size: 0.82rem; margin-bottom: 32px; }
  .btn-submit { background: #e23744; color: #fff; border: none; font-weight: 700; padding: 12px; border-radius: 10px; width: 100%; font-size: 0.95rem; cursor: pointer; transition: 0.2s; }
  .btn-submit:hover { background: #c42f3b; }
  .auth-link { text-align: center; color: #6e6e73; font-size: 0.88rem; margin-top: 18px; }
  .auth-link a { color: #e23744; font-weight: 600; }
</style>
</head>
<body>
<div class="auth-wrap">
  <div class="auth-card">
    <div class="auth-logo">🍽 FoodieApp</div>
    <div class="auth-sub">Create your account</div>
    <form action="register" method="post">
      <div class="row g-3">
        <div class="col-md-6"><label class="form-label">Full Name</label><input type="text" name="name" class="form-control" placeholder="John Doe" required></div>
        <div class="col-md-6"><label class="form-label">Username</label><input type="text" name="username" class="form-control" placeholder="johndoe" required></div>
        <div class="col-md-6"><label class="form-label">Email</label><input type="email" name="email" class="form-control" placeholder="john@email.com" required></div>
        <div class="col-md-6"><label class="form-label">Phone</label><input type="text" name="phone" class="form-control" placeholder="9876543210" required></div>
        <div class="col-12"><label class="form-label">Address</label><input type="text" name="address" class="form-control" placeholder="Your delivery address" required></div>
        <div class="col-12"><label class="form-label">Password</label><input type="password" name="password" class="form-control" placeholder="Create a strong password" required></div>
        <div class="col-12 mt-2"><button type="submit" class="btn-submit">Create Account</button></div>
      </div>
    </form>
    <div class="auth-link">Already have an account? <a href="login.jsp">Sign in</a></div>
  </div>
</div>
</body>
</html>
