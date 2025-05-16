<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-lg border-0 rounded-3">
                <div class="card-body p-4">
                    <h2 class="card-title text-center mb-4">Edit User</h2>
                    <form action="updateUser" method="post" id="editForm">
                        <input type="hidden" name="id" value="${user.id}">
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" id="name" value="${user.name}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="pass" class="form-label">Password</label>
                            <input type="password" name="pass" class="form-control" id="pass" value="${user.pass}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="cpass" class="form-label">Confirm Password</label>
                            <input type="password" name="cpass" class="form-control" id="cpass" value="${user.cpass}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="age" class="form-label">Age</label>
                            <input type="number" name="age" class="form-control" id="age" value="${user.age}" required min="1">
                        </div>
                        
                        <!-- Gender radio buttons -->
                       <fieldset class="mb-3">
						  <legend class="col-form-label pt-0">Gender</legend>
						  
						  <div class="form-check form-check-inline">
						    <input class="form-check-input" 
						           type="radio" id="male" name="gender" value="Male"
						           ${user.gender == 'Male' ? 'checked="checked"' : ''} required>
						    <label class="form-check-label" for="male">Male</label>
						  </div>
						  
						  <div class="form-check form-check-inline">
						    <input class="form-check-input" 
						           type="radio" id="female" name="gender" value="Female"
						           ${user.gender == 'Female' ? 'checked="checked"' : ''}>
						    <label class="form-check-label" for="female">Female</label>
						  </div>
						</fieldset>

                        
                        <button type="submit" class="btn btn-success w-100">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
document.getElementById("editForm").addEventListener("submit", function(e) {
    e.preventDefault(); // Stop default form submission

    Swal.fire({
        title: 'Are you sure?',
        text: "You are about to update the user details.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#198754', // Bootstrap green
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, update it!'
    }).then((result) => {
        if (result.isConfirmed) {
            // Submit the form manually after confirmation
            this.submit();
        }
    });
});
</script>

</body>
</html>
