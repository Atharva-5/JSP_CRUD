<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-gradient" style="background: linear-gradient(to right, #74ebd5, #acb6e5); min-height: 100vh;">

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-header bg-primary text-white text-center rounded-top-4">
                        <h3 class="mb-0">🔐 Reset Your Password</h3>
                    </div>
                    <div class="card-body p-4">
                        
                        <!-- Alert Message (optional) -->
                        <% 
                            String error = request.getParameter("error");
                            String reset = request.getParameter("reset");
                            if ("mismatch".equals(error)) {
                        %>
                            <div class="alert alert-danger">Passwords do not match. Try again.</div>
                        <% } else if ("notfound".equals(error)) { %>
                            <div class="alert alert-warning">User not found. Please check your name.</div>
                        <% } else if ("success".equals(reset)) { %>
                            <div class="alert alert-success">Password reset successful! You can now log in.</div>
                        <% } %>

                        <form action="forgotpass" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Username</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                            </div>

                            <div class="mb-3">
                                <label for="pass" class="form-label">New Password</label>
                                <input type="password" class="form-control" id="pass" name="pass" placeholder="New password" required>
                            </div>

                            <div class="mb-4">
                                <label for="cpass" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="cpass" name="cpass" placeholder="Confirm password" required>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-success btn-lg">Reset Password</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center bg-light rounded-bottom-4">
                        <small>Remembered your password? <a href="login" class="text-decoration-none">Login here</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
