<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-gradient" style="background: linear-gradient(to right, #fceabb, #f8b500); min-height: 100vh;">

<div class="container py-5">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-header bg-warning text-white text-center rounded-top-4">
                    <h3 class="mb-0">🔐 Login</h3>
                </div>
                <div class="card-body p-4">
                    <% 
                        String error = request.getParameter("error");
                        if ("invalid".equals(error)) {
                    %>
                        <div class="alert alert-danger">Invalid username or password.</div>
                    <% } %>
                    
                    <form action="checklogin" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Username</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-4">
                            <label for="pass" class="form-label">Password</label>
                            <input type="password" name="pass" class="form-control" id="pass" placeholder="Enter your password" required>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                            <a href="forgotpass" class="text-decoration-none">Forgot Password?</a>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-lg">Login</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center bg-light rounded-bottom-4">
                    <small>Don’t have an account? <a href="form" class="text-decoration-none">Register here</a></small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
