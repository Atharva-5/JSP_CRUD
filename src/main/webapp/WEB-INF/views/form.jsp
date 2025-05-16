<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="bg-gradient" style="background: linear-gradient(to right, #a1c4fd, #c2e9fb); min-height: 100vh;">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-lg rounded-4">
                <div class="card-header bg-primary text-white text-center rounded-top-4">
                    <h3 class="mb-0">📝 Register</h3>
                </div>
                <div class="card-body p-4">
                    <form action="checkuser" method="post" novalidate>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-3">
                            <label for="pass" class="form-label">Password</label>
                            <input type="password" name="pass" class="form-control" id="pass" placeholder="Enter password" required>
                        </div>
                        <div class="mb-3">
                            <label for="cpass" class="form-label">Confirm Password</label>
                            <input type="password" name="cpass" class="form-control" id="cpass" placeholder="Confirm password" required>
                        </div>
                        <div class="mb-3">
                            <label for="age" class="form-label">Age</label>
                            <input type="number" name="age" class="form-control" id="age" min="1" placeholder="Your age" required>
                        </div>
                        <fieldset class="mb-4">
                          <legend class="col-form-label pt-0">Gender</legend>
                          <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="male" name="gender" value="Male" required>
                            <label class="form-check-label" for="male">Male</label>
                          </div>
                          <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="female" name="gender" value="Female">
                            <label class="form-check-label" for="female">Female</label>
                          </div>
                        </fieldset>

                        <button type="submit" class="btn btn-success btn-lg w-100">Register</button>
                    </form>
                </div>
                <div class="card-footer text-center bg-light rounded-bottom-4">
                    <small>Already have an account? <a href="login" class="text-decoration-none">Login here</a></small>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%
    String error = request.getParameter("error");
    if ("passMismatch".equals(error)) {
%>
<script>
    Swal.fire({
        icon: 'error',
        title: 'Password Mismatch',
        text: 'Password and Confirm Password do not match!',
    });
</script>
<% } else if ("username".equals(error)) { %>
<script>
    Swal.fire({
        icon: 'error',
        title: 'Username Already Exists',
        text: 'The username you entered is already taken. Please choose a different one.',
    });
</script>
<% } %>

</body>
</html>
